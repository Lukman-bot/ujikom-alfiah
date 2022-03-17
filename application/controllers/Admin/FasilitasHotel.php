<?php

class FasilitasHotel extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Mod_fasilitashotel','MFH');
        cek_login();
    }
    public function Index()
    {
        $data=[
            'title'         => 'Hotel-Ku | Master Data',
            'judul'         => 'Master Data',
            'subjudul'      => 'Fasilitas Hotel',
            'breadcrum1'    => 'Master Data',
            'datafasilitashotel'    => $this->MFH->Ambil(['jenisfasilitas'=>'Hotel'])->result()
        ];
        $this->template->load('Admin/Template', 'Admin/FasilitasHotel/Index',$data);
    }
    public function Add()
    {
        $this->form_validation->set_rules('namafasilitas','Nama Fasilitas','required');
        $this->form_validation->set_message('required','{field} tidak boleh kosong.!');
        if($this->form_validation->run()== FALSE) 
        {
            $data=[
                'title'     => 'Hotel-Ku | Master Data',
                'judul'     => 'Master Data',
                'subjudul'  => 'Tambah Fasilitas Hotel',
                'breadcrum1'    => 'Master Data',
            ];
            $this->template->load('Admin/Template', 'Admin/FasilitasHotel/Add',$data);
        }else {
            $acak = rand(1000,9999);
            $foto = $acak . '-IMG-Picture.jpg';
            $config['upload_path']          = './upload';
            $config['allowed_types']         = 'jpg|jpeg|png|JPG|PNG';
            $config['max_size']             = 6024;
            $config['max_width']            = 0;
            $config['max_height']           = 0;
            $config['overwrite']            = TRUE;
            $config['file_ext_tolower']     = TRUE;
            $config['file_name']            = $foto;
            $this->load->library('upload', $config);
            if(!$this->upload->do_upload('galery')) {
                $this->session->set_flashdata('pesan','<div class="alert alert-danger">Data gagal di upload.!</div>');
                redirect('Admin/FasilitasHotel','refresh');
            }else {
                $data=[
                    'namafasilitas'     => $this->input->post('namafasilitas'),
                    'picture'           => $foto,
                    'jenisfasilitas'    => 'Hotel'
                ];
                $this->MFH->Simpan($data);
                
                $this->session->set_flashdata('pesan','<div class="alert alert-success">Data berhasil di simpan.!</div>');
                redirect('Admin/FasilitasHotel', 'refresh');
            }
        }
        
    }
    public function Ubah($id = null)
    {
        $this->form_validation->set_rules('namafasilitas','Nama Fasilitas','required');
        $this->form_validation->set_message('required','{field} tidak boleh kosong.!');
        if($this->form_validation->run()== FALSE) 
        {
            $data=[
                'title'     => 'Hotel-Ku | Master Data',
                'judul'     => 'Master Data',
                'subjudul'  => 'Tambah Fasilitas Hotel',
                'breadcrum1'    => 'Master Data',
                'id'            => $id,
                'dataubahfasilitas' => $this->MFH->Ambil(['idfasilitas'=>$id])->result()
            ];
            $this->template->load('Admin/Template', 'Admin/FasilitasHotel/Ubah',$data);
        }else {
            $acak = rand(1000,9999);
            $foto = $acak . '-IMG-Picture.jpg';
            $config['upload_path']          = './upload';
            $config['allowed_types']        = 'jpg|jpeg|png|JPG|PNG';
            $config['max_size']             = 6024;
            $config['max_width']            = 0;
            $config['max_height']           = 0;
            $config['overwrite']            = TRUE;
            $config['file_ext_tolower']     = TRUE;
            $config['file_name']            = $foto;
            $this->load->library('upload', $config);
            if(!$this->upload->do_upload('galery')) {
                // Jika diubah tanpa gambar 
                $dataubahtanpagambar=[
                    'namafasilitas' => $this->input->post('namafasilitas')
                ];
                $this->MFH->Ubah($dataubahtanpagambar,['idfasilitas' => $id]);
                $this->session->set_flashdata('pesan','<div class="alert alert-success">Data berhasil di perbaharui.!</div>');
                redirect('Admin/FasilitasHotel','refresh');
            }else {
                // Jika di ubah dengan gambar
                $data=[
                    'namafasilitas'     => $this->input->post('namafasilitas'),
                    'picture'           => $foto,
                ];
                $this->MFH->Ubah($data,['idfasilitas'=> $id]);
                
                $this->session->set_flashdata('pesan','<div class="alert alert-success">Data berhasil di Perbaharui.!</div>');
                redirect('Admin/FasilitasHotel', 'refresh');
            }
        }
    }
}