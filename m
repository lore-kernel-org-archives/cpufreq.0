From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 5/8] p4_clockmod: detect speed without relying on
	cpu_khz or user input
Date: Wed, 19 Nov 2003 19:09:46 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119190946.GB5653@redhat.com>
References: <20031119183228.GF20576@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031119183228.GF20576@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Wed, Nov 19, 2003 at 07:32:28PM +0100, Dominik Brodowski wrote:

 > +	rdmsr(0x2c, msr_lo, msr_hi);
 > +
 > +	/* printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi); */
 > +	/* decode the FSB: see IA-32 Intel (C) Architecture Software 
 > +	 * Developer's Manual, Volume 3: System Prgramming Guide,
 > +	 * revision #12 in Table B-1: MSRs in the Pentium 4 and
 > +	 * Intel Xeon Processors, on page B-4 and B-5.
 > +	 */
 > +	if (c->x86_model < 2)
 > +		fsb = 100 * 1000;
 > +	else {
 > +		u8 fsb_code = (msr_lo >> 16) & 0x7;
 > +		switch (fsb_code) {
 > +		case 0:
 > +			fsb = 100 * 1000;
 > +			break;
 > +		case 1:
 > +			fsb = 13333 * 10;
 > +			break;
 > +		case 2:
 > +			fsb = 200 * 1000;
 > +			break;
 > +		}
 > +	}
 > +
 > +	if (!fsb) {
 > +		printk(KERN_DEBUG PFX "couldn't detect FSB speed. Please send an e-mail to <linux@brodo.de>\n");
 > +		printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi);
 > +	}

patch 4/8 introduced what seems to be the exact same code in the speedstep-lib.
Perhaps it belongs in an fsb.o instead that they can both share ?
I don't mind duplicating it twice in object code, but having two copies
in the source seems a bit silly.

		Dave
