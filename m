From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Which cpufreq driver is best for ...
Date: Thu, 04 Sep 2003 14:25:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F572F43.108@basmevissen.nl>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>	<3F55D261.6010407@basmevissen.nl>
	<20030903193040.GB30360@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030903193040.GB30360@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

Dominik Brodowski wrote:

> On Wed, Sep 03, 2003 at 01:37:05PM +0200, Bas Mevissen wrote:
>
>>It depends on what you want. If you want to get battery life to the max 
>>(and power consumption/heat production as low as possible), you need 
>>p4-clockmod.
> 
> Well, if you run CPU hogs, the p4-clockmod driver indeed prolongs battery
> life and reduces heat production. But less work is done, also. So the ratio
> 
> 	amount of energy
> 	----------------
> 	amount of work
> 
> is better (lower) for the speedstep-ich driver than for the p4-clockmod
> driver.
> 

Yes, I should have mentioned that my remark only applied to wall time 
battery life without taking CPU idleing into account.

Regards,

Bas.
