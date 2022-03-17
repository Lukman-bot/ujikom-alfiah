<?php

class FasilitasKamar extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Mod_fasilitaskamar','MFK');
        cek_login();
    }
    public function Index()
    {
        $data=[
            'title'     => 'Hotel-Ku | Master Data',
            'judul'     => 'Master Data',
            'subjudul'  => 'Fasilitas Kamar',
            'breadcrum1'    => 'Master Data',
            'datafasilitaskamar'    => $this->MFK->AmbilKamar()->result()
        ];
        $this->template->load('Admin/Template', 'Admin/FasilitasKamar/Index',$data);
    }
    public function Add()
    {
        $this->form_validation->set_rules('fasilitaskamar','Fasilitas Kamar','required');
        $this->form_validation->set_rules('icon','Icon','required');
        $this->form_validation->set_message('required','{field} tidak boleh kosong');
        if($this->form_validation->run() == false) 
        {
            $data = [
                'title'     => 'Hotel-Ku | Dashboard',
                'judul'     => 'Master Data',
                'subjudul'  => 'Tambah Fasilitas Kamar',
                'breadcrum1'    => 'Tambah Fasilitas Kamar',
               
            ];
            $this->template->load('Admin/Template', 'Admin/FasilitasKamar/Add',$data);
        }else{
            $data=[
                'namafasilitas'     => $this->input->post('fasilitaskamar',TRUE),
                'icon'              => $this->input->post('icon',TRUE),
                'jenisfasilitas'    => 'Kamar'
            ];
            $this->MFK->Simpan($data);
            $this->session->set_flashdata('pesan','<div class="alert alert-success">Data berhasil di simpan.!</div>');
            redirect('Admin/FasilitasKamar', 'refresh');
        }
    }
    public function Ubah($id=null)
    {
        $this->form_validation->set_rules('fasilitaskamar','Fasilitas Kamar','required');
        $this->form_validation->set_rules('icon','Icon','required');
        $this->form_validation->set_message('required','{field} tidak boleh kosong');
        if($this->form_validation->run() == false) 
        {
            $data = [
                'title'     => 'Hotel-Ku | Dashboard',
                'judul'     => 'Master Data',
                'subjudul'  => 'Tambah Fasilitas Kamar',
                'breadcrum1'    => 'Tambah Fasilitas Kamar',
               'id'             => $id,
               'datafasilitaskamar'     => $this->MFK->Ambil(['idfasilitas'=>$id])->result()
            ];
            $this->template->load('Admin/Template', 'Admin/FasilitasKamar/Ubah',$data);
        }else{
            $data=[
                'namafasilitas'     => $this->input->post('fasilitaskamar',TRUE),
                'icon'              => $this->input->post('icon',TRUE),
                'jenisfasilitas'    => 'Kamar'
            ];
            $this->MFK->Ubah($data, ['idfasilitas' => $id]);  
            $this->session->set_flashdata('pesan','<div class="alert alert-success">Data berhasil di simpan.!</div>');
            redirect('Admin/FasilitasKamar', 'refresh');
        }
    }

}