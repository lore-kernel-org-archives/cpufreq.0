From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Cpufreqd and kernel 2.6.2 problem
Date: Thu, 25 Mar 2004 11:15:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040325101502.GB1251@inferi.kami.home>
References: <40628E41.6080806@teleconsult-austria.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40628E41.6080806@teleconsult-austria.at>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk
Cc: abwerzge@teleconsult-austria.at

On Thu, Mar 25, 2004 at 08:46:09AM +0100, G?=AB=E4nther Abwerzger wrote:
> Hi,
>=20
> I've updated the Kernel my SuSE 9.0 running on an ASUS M2400N notebook=20
> to kernel version 2.6.2
> I could also manage to install all required modules to make cpufreqd=20
> work. But it does not work properly - it makes no automatic adjustment=20
> of the processor speed. "rccpufreqd high" brings it to maximum speed,=20
> and "rccpufreqd low" brings it to minimum speed.
>=20
> The only thing that helps is to enter "cpufreqd -d" as root. Then it=20
> works as expected.
>=20
> Did I make something wrong? Or is there a way to automatically start=20
> cpufreqd with the d-option during boot?

uh? I didn't implement any -d option... do you mean a capital D (-D) ?
Anyway I don't know how suse manages rc files, nor if cpufreqd has been
changed in anyway, nor if the config file shipped with the package is ok.

NB: this is the CPUFreq development list for the linux kernel, please
refer to [1] or to me directly to report cpufreq_d_ (the userspace
daemon) problems.

[1]:
project page
www.sf.net/projects/cpufreqd

mailing list at:
https://sourceforge.net/mail/?group_id=3D58904

thanks
--=20
mattia
:wq!
Hodie octavo Kalendas Apriles MMDCCLVII ab urbe condita est
