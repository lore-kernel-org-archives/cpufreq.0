From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Fri, 24 Oct 2003 20:22:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031024182216.GB28421@brodo.de>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
	<1066725533.5237.3.camel@laptop.fenrus.com>
	<20031021095925.GB893@inferi.kami.home>
	<20031021101737.GA31352@wiggy.net>
	<20031021105234.GF893@inferi.kami.home>
	<Pine.SOL.4.53.0310211057060.6187@graphics.cat.nyu.edu>
	<20031021203215.GE26971@brodo.de>
	<20031023143242.GH643@openzaurus.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031023143242.GH643@openzaurus.ucw.cz>
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
To: Pavel Machek <pavel@ucw.cz>
Cc: danielk@mrl.nyu.edu, Mattia Dongili <dongili@supereva.it>, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

On Thu, Oct 23, 2003 at 04:32:43PM +0200, Pavel Machek wrote:
> Hi!
> 
> > Yes indeed. She wants to set a cpufreq policy which suits of her needs: 
> > it consists of a
> > - minimum frequency	=> not too low [she's plugged in]
> 
> I just hope minimum frequency is not going to be
> honoured in case of overheat.
>
> Issue is what happens if user specifies range containing no
> valid frequency. Kernel currently uses next _higher_
> frequency, but going for next lower one seems to be
> important (burning cpus, exploding batteries, ...)

Yes, that's one bug my acpi patchset addresses.

	Dominik
