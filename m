From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: CPUFreq dynamic speed governor, take 2.
Date: Tue, 4 Nov 2003 19:18:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104181831.GT21970@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB600779D0@scsmsx403.sc.intel.com>
	<20031103222510.GB3895@brodo.de>
	<20031104102426.GH21970@poupinou.org>
	<20031104134246.GA4536@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031104134246.GA4536@brodo.de>
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
Cc: Jon Anderson <janderson@janderson.ca>, cpufreq@www.linux.org.uk

On Tue, Nov 04, 2003 at 02:42:46PM +0100, Dominik Brodowski wrote:
> On Tue, Nov 04, 2003 at 11:24:26AM +0100, Ducrot Bruno wrote:
> > > What about +/- 5 % of cpuinfo->max_freq? or +/- 10 % of (policy->max_freq -
> > > policy->min_freq). I think the governor does not need to know of supported
> > > frequencies: the governor says "I need at least n % of processing 
> > > power" == "I need m bogomips of processing power" == (o, CPUFREQ_RELATION_L)
> > > or it says "I need no more than..." == (o, CPUFREQ_RELATION_H)
> > > 
> > 
> > Most of the demand based stuff I see seems to need more "I need to 
> > go up/down one step."  I am not sure that it is a bad design.
> 
> What if there are thousand steps, or even more [like for the geode driver]?
> Then this approach is badly broken.

that unrelated, but this driver is using the frequency table helper, correct?

> > Or else, you loose probably the speedstep stuff for example (something
> > like go up 10%, not enough, go up 10%, etc.).
> 
> You might miss some intermediate steps if you select a too large interval
> here. However, there are other algorithms which calculate a "needed CPU
> percentage" directly, and they won't miss any speedstep state.
> 


I forgot the CPUFREQ_RELATION_[LH], sorry.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
