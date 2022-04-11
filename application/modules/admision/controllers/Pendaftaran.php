<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Pendaftaran extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('PendaftaranModel');
    }

    public function index()
    {
        if ($this->input->server('REQUEST_METHOD') === 'POST') {

            $data = [
                'id_pasien' => $this->input->post('id_pasien'),
                'id_dokter' => $this->input->post('id_dokter'),
                'id_poliklinik' => $this->input->post('id_poliklinik'),
                'tgl_berobat' => $this->input->post('tgl_berobat'),
                'id_asuransi' => $this->input->post('id_asuransi'),
              
               
            ];

            $pendaftaran = $this->PendaftaranModel->insert($data);

            if ($pendaftaran) {
                $response = ['status' => true, 'message' => 'Data pendaftaran berhasil disimpan'];
            } else {
                $response = ['status' => false, 'message' => 'Ooops, terjadi kesalahan ketika menyimpan data'];
            }

            echo json_encode($response);

        } else {

            $data['asuransi'] = $this->PendaftaranModel->asuransi();
            $data['poliklinik'] = $this->PendaftaranModel->poliklinik();
    
            $this->template->render('admision.pendaftaran.index', $data);
        }

    }

    public function fetch_dokter()
    {
        $id_poliklinik = $this->input->post('id_poliklinik');

        $dokters = $this->PendaftaranModel->dokter($id_poliklinik);

        $option = '<option value="">Pilih Dokter</option>';

        foreach($dokters as $dokter) {
            $option .= '<option value="'.$dokter->id_dokter.'">'.$dokter->nama_user.'</option>';
        }

        echo $option;
    }

    public function fetch_pasien()
    {
        $this->datatables->select('nama_user, jenis_kelamin, tgl_lahir, no_identitas, id_user');
        $this->datatables->from('tbl_user');
        $this->datatables->edit_column('id_user', '<button data-id="$1" data-namauser="$2" class="btn btn-xs btn-success pilih-pasien"><i class="fa fa-check"></i> Pilih Pasien</button>', 'id_user, nama_user');

        echo $this->datatables->generate();
    }
}