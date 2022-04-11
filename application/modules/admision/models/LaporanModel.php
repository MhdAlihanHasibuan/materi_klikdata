<?php

class LaporanModel extends CI_Model
{
    public function kunjungan_poliklinik($tahun)
    {
        $tahun = $this->db->escape($tahun);
        
        $this->db->select('
            po.id_poliklinik,
            po.nama_poliklinik,
            SUM(IF(MONTH(p.tgl_berobat) = "01", 1, 0)) AS bulan1,
            SUM(IF(MONTH(p.tgl_berobat) = "02", 1, 0)) AS bulan2,
            SUM(IF(MONTH(p.tgl_berobat) = "03", 1, 0)) AS bulan3,
            SUM(IF(MONTH(p.tgl_berobat) = "04", 1, 0)) AS bulan4,
            SUM(IF(MONTH(p.tgl_berobat) = "05", 1, 0)) AS bulan5,
            SUM(IF(MONTH(p.tgl_berobat) = "06", 1, 0)) AS bulan6,
            SUM(IF(MONTH(p.tgl_berobat) = "07", 1, 0)) AS bulan7,
            SUM(IF(MONTH(p.tgl_berobat) = "08", 1, 0)) AS bulan8,
            SUM(IF(MONTH(p.tgl_berobat) = "09", 1, 0)) AS bulan9,
            SUM(IF(MONTH(p.tgl_berobat) = "10", 1, 0)) AS bulan10,
            SUM(IF(MONTH(p.tgl_berobat) = "11", 1, 0)) AS bulan11,
            SUM(IF(MONTH(p.tgl_berobat) = "12", 1, 0)) AS bulan12
        ');
        $this->db->from('tbl_poliklinik po');
        $this->db->join('tbl_pendaftaran p', 'po.id_poliklinik = p.id_poliklinik AND YEAR(p.tgl_berobat) = ' . $tahun, 'left');
        $this->db->group_by('po.id_poliklinik');

        return $this->db->get()->result();
    }
}