From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Which cpufreq driver is best for ...
Date: Wed, 3 Sep 2003 21:30:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030903193040.GB30360@brodo.de>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<3F55D261.6010407@basmevissen.nl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F55D261.6010407@basmevissen.nl>
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
To: Bas Mevissen <ml@basmevissen.nl>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 01:37:05PM +0200, Bas Mevissen wrote:
> Norbert Preining wrote:
> 
> >Hi!
> >
> >Which cpufreq driver is best for 
> >	Mobile Intel(R) Pentium(R) 4 - M CPU 2.20GHz
> >I can use the
> >	p4-clockmod
> >and the
> >	speedstep-ich
> >With the p4-clockmod I can adapt the freq between 274MHz and 2.2GHz,
> >while with speedstep-ich I can only go between 1.2GHz and 2.2GHz. So I
> >guess p4-clockmod is superior for my chip/cpu.
> >
> 
> It depends on what you want. If you want to get battery life to the max 
> (and power consumption/heat production as low as possible), you need 
> p4-clockmod.

Well, if you run CPU hogs, the p4-clockmod driver indeed prolongs battery
life and reduces heat production. But less work is done, also. So the ratio

	amount of energy
	----------------
	amount of work

is better (lower) for the speedstep-ich driver than for the p4-clockmod
driver.

	Dominik
