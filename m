From: st3@riseup.net
Subject: enhanced intel speedstep feature was Re: speedstep-centrino on
 dothan
Date: Thu, 7 Jul 2005 22:00:27 +0200
Message-ID: <20050707220027.413343d4@horst.morte.male>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com> <20050706211159.GF27630@redhat.com>
	<20050706235557.0c122d33@horst.morte.male>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050706235557.0c122d33@horst.morte.male>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Pedro Ramalhais found another interesting thing in:
ftp://download.intel.com/design/Pentium4/manuals/25366816.pdf

that's the IA32_CLOCK_MODULATION (still called
MSR_IA32_THERM_CONTROL in include/asm-i386/msr.h, and I think this would
need a fix) register, that let set a reduced CPU duty cycle. So just today I
coded something to use it.

Just add to speedstep-centrino.c:
[yes I know, this isn't the Right Coding Style, but it's just to give an
idea of the whole thing]

static int sccm_level = 0;
module_param(sccm_level, uint, 0644);
MODULE_PARM_DESC(sccm_level, "Software Controlled Clock Modulation level: 0
	for disabling, 7 for 12.5\% duty cycle");

in the first part, right after the third #define

and this function after centrino_target():

static int centrino_target_sccm ()
{
        unsigned int msr, h;
        
        rdmsr(MSR_IA32_THERM_CONTROL, msr, h);
        msr &= (0<<1); msr &= (0<<2); msr &= (0<<3);

        switch (sccm_level) {
		case 0:
			msr &= (0<<4);
                case 1:
                        msr |= (1<<4); msr |= (1<<3); msr |= (1<<2);
			msr |= (1<<1); break;
		case 2:
                        msr |= (i<<4); msr |= (1<<3); msr |= (1<<2); break;
                case 3:
                        msr |= (1<<4); msr |= (1<<3); msr |= (1<<1); break;
                case 4:
                        msr |= (1<<4); msr |= (1<<3); break;
                case 5:
                        msr |= (1<<4); msr |= (1<<2); msr |= (1<<1); break;
                case 6:
                        msr |= (1<<4); msr |= (1<<2); break;
                case 7:
                        msr |= (1<<4); msr |= (1<<1); break;
        }

        wrmsr (MSR_IA32_THERM_CONTROL, msr, h);
}

Then you'll just have to insmod speedstep-centrino.ko sccm_level=x, where x
can be 0 to disable software cycle control modulation, 1 to enable a
reduced duty cycle of 87.5%, 7 to enable a duty cycle of 12.5% and so on.

Enabling, say, a duty cycle of 12.5% means that the CPU chip will be driven
by clock just one time every eight, thus reducing power consumption and
temperature (and it speeds down dramatically the CPU, too =).

I tested it so far on my Pentium M Dothan 715 and on a Dothan 725.

What do you think, could this be useful? I could provide a patch or a
stand-alone module. Should I write an interface to sysfs?


--
ciao
st3
