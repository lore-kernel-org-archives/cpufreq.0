From: Nicolas Capit <capitn@free.fr>
Subject: ondemand: cpu load calculation with kernel processus
Date: Thu, 31 May 2007 16:57:44 -0500
Message-ID: <20070531165744.4bf6e18b@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1566493000=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:date:from:to:subject:message-id:x-mailer:mime-version:content-type:sender;
	b=N3preqa4I9uAWO+/3O5MnkD04GFHnMQyIl3rzrdOxIJ6dOo0ovoKPbQlyKgstNBVGRb9Eza1WXqQbUd/ALAMX4OSez/R+s9kjutmWMDAdyoFXzR0YVXpSS/w/WxHRioR+ZcQCnMMpqrIy5FfcZI93woBDUjh49i61AjBkgD5scc=
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

--===============1566493000==
Content-Type: multipart/signed; boundary="Sig_S3dpOdSBfN/c41BtK0vtKAH";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_S3dpOdSBfN/c41BtK0vtKAH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

I am running a Debian unstable with a kernel 2.6.21-1-686 and using
modules powernow_k8 and cpufreq_ondemand.

My configuration with the ondemand governor seems to work very well
except when my cpu is busy by the kernel processus kcryptd. The cpu is
100% busy but the frequency is not increased.
(I am using the module dm_crypt to encrypt my home filesystem)

So my question is:
Does the ondemand governor calculate the load of the machine with user
level and *kernel* level processus?


Thanks,

Nicolas.


--Sig_S3dpOdSBfN/c41BtK0vtKAH
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGX0TYEzSMHRwFJjYRAq8qAJ9AIEuwFDGUEb9pU/FV7lLUlO34/QCdHLL7
fwDXI1aaorH0HLHFm6ky3Qs=
=qeQc
-----END PGP SIGNATURE-----

--Sig_S3dpOdSBfN/c41BtK0vtKAH--


--===============1566493000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1566493000==--

