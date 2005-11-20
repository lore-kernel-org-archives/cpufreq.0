From: Luca <luca.foppiano@gmail.com>
Subject: Re: cpufreq on Coppermine
Date: Sun, 20 Nov 2005 02:19:28 +0100
Message-ID: <460afdfa0511191719s6749b5cfq93bad11d1a878d89@mail.gmail.com>
References: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
	<20051118154149.GA2104@poupinou.org>
	<460afdfa0511181139p40db432fm544e480f554e9a0@mail.gmail.com>
	<20051119192909.GA4190@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20051119192909.GA4190@inferi.kami.home>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>, Luca <luca.foppiano@gmail.com>

On 11/19/05, Mattia Dongili <malattia@linux.it> wrote:
> > I think don't work with 2.6 kernel...
>
> just for the purpose to make it build you can apply the attached patch,
> it uses an adapted (from LDD3) Makefile for 2.6 and changes from
> pci_find_subsys to pci_get_subsys. Still, you need to define
> I_WANT_SPEEDSTEP at line 42 as before.

I do the patch and I compile the speedstep_bx, this is the result:

pj@cristal:/usr/local/src/speedstep_bx$ sudo make
make -C /lib/modules/2.6.14p3.laptop.cfd/build
M=3D/usr/local/src/speedstep_bx modules
make[1]: Entering directory `/usr/src/linux-2.6.14'
  CC [M]  /usr/local/src/speedstep_bx/speedstep.o
/usr/local/src/speedstep_bx/speedstep.c: In function 'speedstep_initialize'=
:
/usr/local/src/speedstep_bx/speedstep.c:489: warning: 'low' may be
used uninitialized in this function
/usr/local/src/speedstep_bx/speedstep.c:489: warning: 'high' may be
used uninitialized in this function
  Building modules, stage 2.
  MODPOST
*** Warning: "__fixunsdfsi" [/usr/local/src/speedstep_bx/speedstep.ko]
undefined!
*** Warning: "__divdf3" [/usr/local/src/speedstep_bx/speedstep.ko] undefine=
d!
*** Warning: "__muldf3" [/usr/local/src/speedstep_bx/speedstep.ko] undefine=
d!
*** Warning: "__adddf3" [/usr/local/src/speedstep_bx/speedstep.ko] undefine=
d!
*** Warning: "__floatsidf" [/usr/local/src/speedstep_bx/speedstep.ko] undef=
ined!
  LD [M]  /usr/local/src/speedstep_bx/speedstep.ko
make[1]: Leaving directory `/usr/src/linux-2.6.14'
pj@cristal:/usr/local/src/speedstep_bx$


next I copied the modules in the kernel module dir, and when I try to
load the module I return this error:

pj@cristal:/usr/local/src/speedstep_bx$ sudo modprobe speedstep -vvvv
insmod /lib/modules/2.6.14p3.laptop.cfd/kernel/arch/i386/kernel/cpu/cpufreq=
/speedstep.ko
FATAL: Error inserting speedstep
(/lib/modules/2.6.14p3.laptop.cfd/kernel/arch/i386/kernel/cpu/cpufreq/speed=
step.ko):
Unknown symbol in module, or unknown parameter (see dmesg)

and dmesg return this error:
speedstep: Unknown symbol __floatsidf
speedstep: Unknown symbol __fixunsdfsi
speedstep: Unknown symbol __adddf3
speedstep: Unknown symbol __divdf3
speedstep: Unknown symbol __muldf3

I have kernel 2.6.14 compiled with debug symbols on cpufreq...
tell me if do you need some information...

tnks you
Luca
