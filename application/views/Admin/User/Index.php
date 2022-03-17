<?php if ($this->session->flashdata('pesan')) : ?>
    <div class="alert alert-success">
        <?= $this->session->flashdata('pesan') ?>
    </div>
<?php endif ?>

<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <a href="<?= base_url('index.php/Admin/User/add') ?>">
                    <button class="btn btn-primary btn-md pull-right">
                        <li class="fa fa-plus"></li> Add User
                    </button>
                </a>
            </div>
            <div class="box-body table-reseponsive">
                <table class="table table-hover" id="example1">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nama User</th>
                            <th>Jenis Kelamin</th>
                            <th>Alamat</th>
                            <th>No Telepon</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Photo</th>
                            <th>Option</th>
                        </tr>
                    </thead>
                    <?php
                        $no=1;
                        foreach($dataUser as $tampilkan) {
                            echo "<tr>";
                                echo "<td>$no</td>";
                                echo "<td>$tampilkan->namauser</td>";
                                echo "<td>$tampilkan->jk</td>";
                                echo "<td>$tampilkan->alamat</td>";
                                echo "<td>$tampilkan->notelepon</td>";
                                echo "<td>$tampilkan->username</td>";
                                echo "<td>$tampilkan->role</td>";
                                echo "<td><img src=".base_url('upload/').$tampilkan->photo." width='100' ></td>";
                                echo "<td><a href=".base_url('index.php/Admin/User/Ubah/').$tampilkan->idusers."><button class='btn btn-primary btn-xs'><li class='fa fa-list'></li></button></a></td>";
                            echo "</tr>";
                            $no ++;
                        }
                    ?>
                </table>
            </div>
        </div>
    </div>
</div>