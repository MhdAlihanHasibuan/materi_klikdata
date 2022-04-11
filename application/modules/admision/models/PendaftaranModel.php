<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class PendaftaranModel extends CI_Model
{
    public function asuransi()
    {
        return $this->db->get('tbl_asuransi')->result();
    }   

    public function poliklinik()
    {
        return $this->db->get('tbl_poliklinik')->result();
    }

    public function dokter($id_poliklinik)
    {   $this->db->select('*');
        $this->db->from('tbl_dokter_jaga dj');
        $this->db->join('tbl_user tu', 'dj.id_dokter = tu.id_user');
        $this->db->join('tbl_poliklinik tp', 'dj.id_poliklinik = tp.id_poliklinik');
        $this->db->group_by('dj.id_dokter');
        return $this->db->get_where('tbl_dokter_jaga', [
            'dj.id_poliklinik' => $id_poliklinik
        ])->result();
    }

    public function insert($data)
    {
        $this->db->insert('tbl_pendaftaran', $data);

        return $this->db->insert_id();
    }

    public function ambil_data_pasien()
    {
        return $this->db->get('tbl_user')->result();
    }
}