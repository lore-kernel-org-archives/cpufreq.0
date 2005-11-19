From: Luca <luca.foppiano@gmail.com>
Subject: Re: cpufreq on Coppermine
Date: Sat, 19 Nov 2005 10:00:39 +0100
Message-ID: <460afdfa0511190100m1e6ca9b6t48d60ac12f673761@mail.gmail.com>
References: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
	<20051118154149.GA2104@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051118154149.GA2104@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

I try to load speedstep-smi module with debug info and this is the
result of debug:

Nov 19 09:52:44 cristal kernel: speedstep-lib: x86: 6, model: 8
Nov 19 09:52:44 cristal kernel: speedstep-lib: Coppermine:
MSR_IA32_EBL_CR_POWERON is 0x46480020, 0x0
Nov 19 09:52:44 cristal kernel: speedstep-lib: Coppermine:
MSR_IA32_PLATFORM ID is 0x0, 0x4b560000
Nov 19 09:52:44 cristal kernel: speedstep-smi: signature:0x47534943,
command:0x008000b2, event:0x000000b3, perf_level:0x07d00001.
Nov 19 09:52:44 cristal kernel: cpufreq-core: trying to register
driver speedstep-smi
Nov 19 09:52:44 cristal kernel: cpufreq-core: adding CPU 0
Nov 19 09:52:44 cristal kernel: speedstep-smi: trying to obtain
ownership with command 47534980 at port b2
Nov 19 09:52:44 cristal kernel: speedstep-smi: result is 0
Nov 19 09:52:44 cristal kernel: speedstep-smi: trying to determine
frequencies with command 47534980 at port b2
Nov 19 09:52:44 cristal kernel: speedstep-smi: result 47534980,
low_freq 0, high_freq 4
Nov 19 09:52:44 cristal kernel: speedstep-smi: could not detect low
and high frequencies by SMI call.
Nov 19 09:52:44 cristal kernel: speedstep-lib: trying to determine both spe=
eds
Nov 19 09:52:44 cristal kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Nov 19 09:52:44 cristal kernel: speedstep-lib: speed is 700000
Nov 19 09:52:44 cristal kernel: speedstep-lib: previous speed is 700000
Nov 19 09:52:44 cristal kernel: speedstep-smi: trying to set frequency
to state 1 with command 47534980 at port b2
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 1, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 2, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 3, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 4, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 5, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Nov 19 09:52:44 cristal kernel: speedstep-lib: speed is 700000
Nov 19 09:52:44 cristal kernel: speedstep-lib: low speed is 700000
Nov 19 09:52:44 cristal kernel: speedstep-smi: trying to set frequency
to state 0 with command 47534980 at port b2
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 1, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 2, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 3, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 4, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-smi: retry 5, previous
result 0, waiting...
Nov 19 09:52:44 cristal kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Nov 19 09:52:44 cristal kernel: speedstep-lib: speed is 700000
Nov 19 09:52:44 cristal kernel: speedstep-lib: high speed is 700000
Nov 19 09:52:44 cristal kernel: speedstep-smi: could not detect two
different speeds -- aborting.
Nov 19 09:52:44 cristal kernel: cpufreq-core: initialization failed
Nov 19 09:52:44 cristal kernel: cpufreq-core: no CPU initialized for
driver speedstep-smi
Nov 19 09:52:44 cristal kernel: cpufreq-core: unregistering CPU 0


If I power on the laptop with AC, it work at 700 mhz and with only the
battery 550mhz...
I thinks the modules don't found the low speed...
what you think?

help
bye
tnks
Luca
