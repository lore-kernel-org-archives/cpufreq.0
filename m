From: Stefan Tomanek <stefan@pico.ruhr.de>
Subject: Re: static freq table support for Pentium M Dothan
Date: Thu, 9 Sep 2004 18:41:12 +0000 (UTC)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <loom.20040909T204016-479@post.gmane.org>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
	<loom.20040908T215751-536@post.gmane.org>
	<20040908213140.GA7842@dominikbrodowski.de>
	<loom.20040908T233809-28@post.gmane.org>
	<20040908220139.GA8116@dominikbrodowski.de>
	<loom.20040909T010454-526@post.gmane.org>
	<20040909085802.GF16132@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Bruno Ducrot <ducrot <at> poupinou.org> writes:

> It's indeed the SMM interface, not direct hardware access, with also a
> broken mask (out of spec indeed) for the control register.

Ahh, and this is....bad I guess?

> I guess 'the other OS' may actually use somehow the full eax before doing
> the outb and then allowing somehow ancient version of speedstep to
> work...

It uses the whatwhat before doing the somethingsomething?
Please excuse my incompetence ;-)
