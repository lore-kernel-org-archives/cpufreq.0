From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreq driver for nForce2
Date: Mon, 7 Jun 2004 15:19:29 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040607131929.GL13782@poupinou.org>
References: <40BF2860.1070502@hasw.net>
	<20040606162052.GA26435@dominikbrodowski.de>
	<40C371A8.1030005@hasw.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40C371A8.1030005@hasw.net>
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
To: Sebastian Witt <se.witt@gmx.net>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

On Sun, Jun 06, 2004 at 09:34:00PM +0200, Sebastian Witt wrote:
> 
> >- Speaking of stability: changing the FSB on the fly proved to be difficult
> >  on other platforms. While I think the method used in nforce2 is less
> >  error-prone, it might be good to add some big warning to the kernel logs
> 
> Yes, this is only possible because the PCI/AGP clock is independent from 
> the FSB. I added a warning.

Are you sure?  It's very likely PCI and AGP clocks are multiples
of SYSCLK (but I must admit I know nothing about nForce2)?

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
