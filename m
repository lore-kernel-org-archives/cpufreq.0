From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Thu, 23 Oct 2003 16:32:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031023143242.GH643@openzaurus.ucw.cz>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
	<1066725533.5237.3.camel@laptop.fenrus.com>
	<20031021095925.GB893@inferi.kami.home>
	<20031021101737.GA31352@wiggy.net>
	<20031021105234.GF893@inferi.kami.home>
	<Pine.SOL.4.53.0310211057060.6187@graphics.cat.nyu.edu>
	<20031021203215.GE26971@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031021203215.GE26971@brodo.de>
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
Cc: danielk@mrl.nyu.edu, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, Mattia Dongili <dongili@supereva.it>

Hi!

> Yes indeed. She wants to set a cpufreq policy which suits of her needs: 
> it consists of a
> - minimum frequency	=> not too low [she's plugged in]

I just hope minimum frequency is not going to be
honoured in case of overheat.

Issue is what happens if user specifies range containing no
valid frequency. Kernel currently uses next _higher_
frequency, but going for next lower one seems to be
important (burning cpus, exploding batteries, ...)
-- 
				Pavel
Written on sharp zaurus, because my Velo1 broke. If you have Velo you don't need...
