From: Niels Borne <niels.borne@laposte.net>
Subject: hardware limits
Date: Sun, 28 May 2006 09:37:11 +0200
Message-ID: <44795327.5000809@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi there,

I am working on a vaio laptop pcg-fr415b, using fc5 (see result of cat=20
/proc/cpuinfo above).
Since it is quite noisy I allowed cpuspeed at startup and this improved=20
the situation a little bit.
Still cpufreq-info (see details above -in french, but you can guess) gives
hardware limits : 2.10 GHz - 2.80 GHz
Is there any hope to go below 2.10 GHz and if yes, how ?

Thanks,

Niels









cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Celeron(R) CPU 2.80GHz
stepping        : 9
cpu MHz         : 2100.000
cache size      : 128 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 mtrr pge mca cmov=20
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid xtpr
bogomips        : 5589.50



cpufreq-info
cpufrequtils 0.4: cpufreq-info (C) Dominik Brodowski 2004
Veuillez rapportez les erreurs et les bogues =E0 linux@brodo.de, s'il vous =

plait.
analyse du CPU 0 :
   pilote : p4-clockmod
   CPUs qui doivent changer de fr=E9quences en m=EAme temps : 0
   limitation mat=E9rielle : 2.10 GHz - 2.80 GHz
   plage de fr=E9quence : 2.10 GHz, 2.45 GHz, 2.80 GHz
   r=E9gulateurs disponibles : userspace, performance
   tactique actuelle : la fr=E9quence doit =EAtre comprise entre 2.10 GHz e=
t=20
2.80 GHz.
                   Le r=E9gulateur "userspace" est libre de choisir la vite=
sse
                   dans cette plage de fr=E9quences.
   la fr=E9quence actuelle de ce CPU est 2.10 GHz.
