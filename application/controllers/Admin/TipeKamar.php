<?php

class TipeKamar extends CI_Controller
{
        public function __construct()
        {
            parent::__construct();
            $this->load->model('Mod_tipekamar','MTK');
            cek_login();
        }
        public function Index()
        {
            $data=[
                'title'     => 'Hotel-Ku | Master Data',
                'judul'     => 'Master Data',
                'subjudul'  => 'Tipe Kamar',
                'breadcrum1'    => 'Master Data',
                'datatipekamar'    => $this->MTK->AmbilALL()->result()
            ];
            $this->template->load('Admin/Template', 'Admin/TipeKamar/Index',$data);
        }
        public function Add()
        {
            $this->form_validation->set_rules('tipekamar','Tipe Kamar','required');
            $this->form_validation->set_message('required','{field} tidak boleh kosong');
            if($this->form_validation->run() == false) 
            {
                $data = [
                    'title'     => 'Hotel-Ku | Dashboard',
                    'judul'     => 'Master Data',
                    'subjudul'  => 'Tambah Tipe Kamar',
                    'breadcrum1'    => 'Tambah Tipe Kamar',
                   
                ];
                $this->template->load('Admin/Template', 'Admin/TipeKamar/Add',$data);
            }else{
                $data=[
                    'tipekamar'     => $this->input->post('tipekamar',TRUE),
                ];
                $this->MTK->Simpan($data);
                $this->session->set_flashdata('pesan','<div class="alert alert-success">Data berhasil di simpan.!</div>');
                redirect('Admin/TipeKamar', 'refresh');
            }
        }
        public function Ubah($id=null)
        {
            $this->form_validation->set_rules('tipekamar','Tipe Kamar','required');
            $this->form_validation->set_message('required','{field} tidak boleh kosong');
            if($this->form_validation->run() == FALSE)
            {
                $data = [
                    'title'     => 'Hotel-Ku | Dashboard',
                    'judul'     => 'Master Data',
                    'subjudul'  => 'Ubah Tipe Kamar',
                    'breadcrum1'    => 'Ubah Tipe Kamar',
                    'datatipekamar' => $this->MTK->Ambil(['idtipekamar'=> $id])->result(),
                    'id'            => $id
            ];
            $this->template->load('Admin/Template', 'Admin/TipeKamar/Ubah',$data);
        } else {
            $data=[
                'tipekamar'     => $this->input->POST('tipekamar',TRUE)
            ];
            $this->MTK->Ubah($data,['idtipekamar'=>$id]);
            $this->session->set_flashdata('pesan','<div class="alert alert-success">Data Tipe Kamar berhasil di perbaharui</div>');
            redirect('Admin/TipeKamar', 'refresh');
        }
    }
}