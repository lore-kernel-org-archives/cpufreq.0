From: Hakan BAYINDIR <hakan@bayindir.org>
Subject: Q6600 CPU Frequency Scaling Problem / Bug
Date: Mon, 30 Jun 2008 22:50:50 +0300
Message-ID: <4869391A.9010006@bayindir.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0414072118=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0414072118==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig4A591DAF5B8CBC441F388D0E"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4A591DAF5B8CBC441F388D0E
Content-Type: multipart/mixed; boundary="------------090202020404020609050409"

This is a multi-part message in MIME format.
--------------090202020404020609050409
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm running Debian testing on an Intel Core2Quad Q6600 with 4GB DDR2 RAM
on a MSI P35 Platinum board since December 07. When I first migrated my
system on December (I've installed Debian as etch beta1 and upgrading
since), every core of the CPU was scaling their frequency independently.
After installing 2.6.22, The cores started to scale in a synchronized
way. I.e. when a core needs to speed-up, every core speeds up in sync.
The weird thing is, I have another clone of this OS at my office running
on a core 2 duo processor and that system scaled its processors
independently.

The ganged scaling behavior is also consistent with the
/sys/devices/system/cpuX/cpufreq/affected_cpus file and cpufreq-info
command. Both of them shows that all CPU's speeds are need to be in sync
while there's really no need. Also Ubuntu 8.04 Live CD exhibits the same
behavior and this behavior can be verified under sysfs again.

Is it a bug? Is it expected? I can provide more information if it's
needed. I'm attaching cpufreq-info's output as a reference.


Cheers and Regards,


-- Hakan.


--------------090202020404020609050409
Content-Type: text/plain;
 name="cpufreq-info.out.txt"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="cpufreq-info.out.txt"

Y3B1ZnJlcXV0aWxzIDAwMjogY3B1ZnJlcS1pbmZvIChDKSBEb21pbmlrIEJyb2Rvd3NraSAy
MDA0LTIwMDYKUmVwb3J0IGVycm9ycyBhbmQgYnVncyB0byBsaW51eEBicm9kby5kZSwgcGxl
YXNlLgphbmFseXppbmcgQ1BVIDA6CiAgZHJpdmVyOiBhY3BpLWNwdWZyZXEKICBDUFVzIHdo
aWNoIG5lZWQgdG8gc3dpdGNoIGZyZXF1ZW5jeSBhdCB0aGUgc2FtZSB0aW1lOiAwIDEgMiAz
CiAgaGFyZHdhcmUgbGltaXRzOiAxLjYwIEdIeiAtIDIuNDAgR0h6CiAgYXZhaWxhYmxlIGZy
ZXF1ZW5jeSBzdGVwczogMi40MCBHSHosIDIuMTQgR0h6LCAxLjg3IEdIeiwgMS42MCBHSHoK
ICBhdmFpbGFibGUgY3B1ZnJlcSBnb3Zlcm5vcnM6IHVzZXJzcGFjZSwgcG93ZXJzYXZlLCBv
bmRlbWFuZCwgY29uc2VydmF0aXZlLCBwZXJmb3JtYW5jZQogIGN1cnJlbnQgcG9saWN5OiBm
cmVxdWVuY3kgc2hvdWxkIGJlIHdpdGhpbiAxLjYwIEdIeiBhbmQgMi40MCBHSHouCiAgICAg
ICAgICAgICAgICAgIFRoZSBnb3Zlcm5vciAib25kZW1hbmQiIG1heSBkZWNpZGUgd2hpY2gg
c3BlZWQgdG8gdXNlCiAgICAgICAgICAgICAgICAgIHdpdGhpbiB0aGlzIHJhbmdlLgogIGN1
cnJlbnQgQ1BVIGZyZXF1ZW5jeSBpcyAxLjYwIEdIei4KYW5hbHl6aW5nIENQVSAxOgogIGRy
aXZlcjogYWNwaS1jcHVmcmVxCiAgQ1BVcyB3aGljaCBuZWVkIHRvIHN3aXRjaCBmcmVxdWVu
Y3kgYXQgdGhlIHNhbWUgdGltZTogMCAxIDIgMwogIGhhcmR3YXJlIGxpbWl0czogMS42MCBH
SHogLSAyLjQwIEdIegogIGF2YWlsYWJsZSBmcmVxdWVuY3kgc3RlcHM6IDIuNDAgR0h6LCAy
LjE0IEdIeiwgMS44NyBHSHosIDEuNjAgR0h6CiAgYXZhaWxhYmxlIGNwdWZyZXEgZ292ZXJu
b3JzOiB1c2Vyc3BhY2UsIHBvd2Vyc2F2ZSwgb25kZW1hbmQsIGNvbnNlcnZhdGl2ZSwgcGVy
Zm9ybWFuY2UKICBjdXJyZW50IHBvbGljeTogZnJlcXVlbmN5IHNob3VsZCBiZSB3aXRoaW4g
MS42MCBHSHogYW5kIDIuNDAgR0h6LgogICAgICAgICAgICAgICAgICBUaGUgZ292ZXJub3Ig
Im9uZGVtYW5kIiBtYXkgZGVjaWRlIHdoaWNoIHNwZWVkIHRvIHVzZQogICAgICAgICAgICAg
ICAgICB3aXRoaW4gdGhpcyByYW5nZS4KICBjdXJyZW50IENQVSBmcmVxdWVuY3kgaXMgMS42
MCBHSHouCmFuYWx5emluZyBDUFUgMjoKICBkcml2ZXI6IGFjcGktY3B1ZnJlcQogIENQVXMg
d2hpY2ggbmVlZCB0byBzd2l0Y2ggZnJlcXVlbmN5IGF0IHRoZSBzYW1lIHRpbWU6IDAgMSAy
IDMKICBoYXJkd2FyZSBsaW1pdHM6IDEuNjAgR0h6IC0gMi40MCBHSHoKICBhdmFpbGFibGUg
ZnJlcXVlbmN5IHN0ZXBzOiAyLjQwIEdIeiwgMi4xNCBHSHosIDEuODcgR0h6LCAxLjYwIEdI
egogIGF2YWlsYWJsZSBjcHVmcmVxIGdvdmVybm9yczogdXNlcnNwYWNlLCBwb3dlcnNhdmUs
IG9uZGVtYW5kLCBjb25zZXJ2YXRpdmUsIHBlcmZvcm1hbmNlCiAgY3VycmVudCBwb2xpY3k6
IGZyZXF1ZW5jeSBzaG91bGQgYmUgd2l0aGluIDEuNjAgR0h6IGFuZCAyLjQwIEdIei4KICAg
ICAgICAgICAgICAgICAgVGhlIGdvdmVybm9yICJvbmRlbWFuZCIgbWF5IGRlY2lkZSB3aGlj
aCBzcGVlZCB0byB1c2UKICAgICAgICAgICAgICAgICAgd2l0aGluIHRoaXMgcmFuZ2UuCiAg
Y3VycmVudCBDUFUgZnJlcXVlbmN5IGlzIDEuNjAgR0h6LgphbmFseXppbmcgQ1BVIDM6CiAg
ZHJpdmVyOiBhY3BpLWNwdWZyZXEKICBDUFVzIHdoaWNoIG5lZWQgdG8gc3dpdGNoIGZyZXF1
ZW5jeSBhdCB0aGUgc2FtZSB0aW1lOiAwIDEgMiAzCiAgaGFyZHdhcmUgbGltaXRzOiAxLjYw
IEdIeiAtIDIuNDAgR0h6CiAgYXZhaWxhYmxlIGZyZXF1ZW5jeSBzdGVwczogMi40MCBHSHos
IDIuMTQgR0h6LCAxLjg3IEdIeiwgMS42MCBHSHoKICBhdmFpbGFibGUgY3B1ZnJlcSBnb3Zl
cm5vcnM6IHVzZXJzcGFjZSwgcG93ZXJzYXZlLCBvbmRlbWFuZCwgY29uc2VydmF0aXZlLCBw
ZXJmb3JtYW5jZQogIGN1cnJlbnQgcG9saWN5OiBmcmVxdWVuY3kgc2hvdWxkIGJlIHdpdGhp
biAxLjYwIEdIeiBhbmQgMi40MCBHSHouCiAgICAgICAgICAgICAgICAgIFRoZSBnb3Zlcm5v
ciAib25kZW1hbmQiIG1heSBkZWNpZGUgd2hpY2ggc3BlZWQgdG8gdXNlCiAgICAgICAgICAg
ICAgICAgIHdpdGhpbiB0aGlzIHJhbmdlLgogIGN1cnJlbnQgQ1BVIGZyZXF1ZW5jeSBpcyAx
LjYwIEdIei4K
--------------090202020404020609050409--

--------------enig4A591DAF5B8CBC441F388D0E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIaTkajzSH49UjSJwRAjXBAJ4k0UUC7uPwmlnmj5oDksyfaoEePwCggNga
dJ3bbxogH+6wHf+XjOZGgEc=
=VBMP
-----END PGP SIGNATURE-----

--------------enig4A591DAF5B8CBC441F388D0E--


--===============0414072118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0414072118==--

