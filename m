From: Luca <luca.foppiano@gmail.com>
Subject: Re: cpufreq on Coppermine
Date: Sun, 20 Nov 2005 20:41:08 +0100
Message-ID: <460afdfa0511201141l68fc7e56oabe4ddb917e1eb27@mail.gmail.com>
References: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
	<20051118154149.GA2104@poupinou.org>
	<460afdfa0511181139p40db432fm544e480f554e9a0@mail.gmail.com>
	<20051119192909.GA4190@inferi.kami.home>
	<460afdfa0511191719s6749b5cfq93bad11d1a878d89@mail.gmail.com>
	<20051120143332.GF4582@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051120143332.GF4582@inferi.kami.home>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Luca <luca.foppiano@gmail.com>, cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>

On 11/20/05, Mattia Dongili <malattia@linux.it> wrote:
> Ah, -msoft-float. Either change the '#if 0' to '#if 1' at line 449 or
> build with 'make EXTRA_CFLAGS=3D-mhard-float'

I have modified the speedstep.c file and I have compiled the modules,
but when I load it I return this error:

Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: read_core_mult()
MSR_IA32_EBL_CR_POWERON 0x46480020 0x00000000
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: speedstep_initialize()
Processor at 700000 kHz
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: speedstep_initialize() pmbase
is 0x1000
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_read_state() called
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_read_state()
MSR_IA32_EBL_CR_POWERON 0x46480020 0x00000000
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_read_state() gpo_hilo:
0xfe
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_read_state()        ->=20
0x00
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: speedstep_initialize() state
is 0
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: speedstep_initialize() trying
to switch to state 1
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition() called
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()     state
is 01
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()
MSR_IA32_EBL_CR_POWERON 0x46480020 0x00000000
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()    s is
fe...
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()    ...
and now s is ff
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()   cntb
before: 0x00103a3f 00000000 00010000 00111010 00111111
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()   cntb
after:  0x00103fff 00000000 00010000 00111111 11111111
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()   pcntrl
before: 0x00001202 00000000 00000000 00010010 00000010
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()   pcntrl
after:  0x00001a02 00000000 00000000 00011010 00000010
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition() we
survive to C3...
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: cpu_do_transition()
MSR_IA32_EBL_CR_POWERON 0x46480020 0x00000000
Nov 20 20:30:31 cristal kernel:
/usr/local/src/speedstep_bx/speedstep.c: read_core_mult()
MSR_IA32_EBL_CR_POWERON 0x46480020 0x00000000

mmm...what is the problem? Is not supported?
tell me if you do some information..I don't know what to do...
help
thanks very much
Luca
