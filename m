From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: static freq table support for Pentium M Dothan
Date: Thu, 9 Sep 2004 17:33:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040909153316.GA4574@dominikbrodowski.de>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
	<loom.20040908T215751-536@post.gmane.org>
	<20040908213140.GA7842@dominikbrodowski.de>
	<loom.20040908T233809-28@post.gmane.org>
	<20040908220139.GA8116@dominikbrodowski.de>
	<loom.20040909T010454-526@post.gmane.org>
	<20040909085802.GF16132@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040909085802.GF16132@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk, Stefan Tomanek <stefan@pico.ruhr.de>

On Thu, Sep 09, 2004 at 10:58:02AM +0200, Bruno Ducrot wrote:
> > acpi_pdump: P0: 1500 MHz, 0 mW, 100 uS s:0x0 c:0x83
> > acpi_pdump: P1: 600 MHz, 0 mW, 100 uS s:0x1 c:0x183
> > control_register:
> > 130 12 1 16 0 0 178
> > status_register:
> > 130 12 1 8 0 0 179
> 
> It's indeed the SMM interface, not direct hardware access, with also a
> broken mask (out of spec indeed)
Why is it out of spec?

> I guess 'the other OS' may actually use somehow the full eax before doing
> the outb and then allowing somehow ancient version of speedstep to
> work...

Possibly. But fortunately we don't need to :)

	Dominik
