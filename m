From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: CPUFreq dynamic speed governor, take 2.
Date: Tue, 4 Nov 2003 11:24:26 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104102426.GH21970@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB600779D0@scsmsx403.sc.intel.com>
	<20031103222510.GB3895@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031103222510.GB3895@brodo.de>
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

On Mon, Nov 03, 2003 at 11:25:10PM +0100, Dominik Brodowski wrote:
> On Sat, Nov 01, 2003 at 07:46:20PM -0800, Pallipadi, Venkatesh wrote:
> > > That's not entirely correct -- it just has rather strict limits on the
> > > "transition latency", and several cpfureq drivers don't set the proper
> > > transition latency but the dummy value "CPUFREQ_ETERNAL" 
> > > which disables
> > > dynamic governors [in kernelspace].
> > 
> > 
> > We can change ondemand governor to expose the minimum transition 
> > latency through sysfs, if that helps. But then, the sampling frequency 
> > should depend on the transition latency, in order to make sure that 
> > sampling itself will not be a performance overhead.
> 
> I'd prefer if the minimum transition latency depends on the sampling
> frequency.
> 
> > This is the same reason why I removed the default option in the 
> > latest version of ondemand governor.
> > Having said that, I think better option here is to have a  
> > list of governor's defined in some order, instead of 
> > having one default governor. And during initialization we 
> > can call init of each governor in the list, until we succeed. 
> > Similar logic is used in various places in kernel,
> > like i386 timer initialization, i386 sub-arch detection etc.
> 
> That's one thing I dislike about the i386 timer initialization code [and I
> just had a discussion about this with John Stulz a few days ago]. I think
> the cpufreq core could get along _without any_ cpufreq governor loaded as
> default, but that's 2.7. material.
> 
> > > Actually, this is a problem in Venkatesh's code: If the 
> > > governor says "there's
> > > too few processing power available, let's increase the speed" 
> > > it increases
> > > the current speed by 1 kHz, and says this is a "low limit" 
> > > which means that
> > > the new speed must be higher than that. For the common 
> > > frequency scaling
> > > implementations out there, which define only few frequency 
> > > states, this is
> > > not a problem. For the geode driver, though, which has 
> > > several thousand
> > > frequency states available IIRC, this is a big problem: switching from
> > > lowest to highest speed may take a couple of seconds or even minutes!
> > 
> > 
> > Yes. I had assumed that the number of states is of the order of 5-10. 
> > If we have several thousand states then, ondemand governor will be crawl
> > on 
> > its knees. The reason I had to depend on +1, -1 logic, is because I
> > couldn't
> > find any other simple/clean way of getting the supported frequencies
> > from
> > the low level frequency driver.
> 
> What about +/- 5 % of cpuinfo->max_freq? or +/- 10 % of (policy->max_freq -
> policy->min_freq). I think the governor does not need to know of supported
> frequencies: the governor says "I need at least n % of processing 
> power" == "I need m bogomips of processing power" == (o, CPUFREQ_RELATION_L)
> or it says "I need no more than..." == (o, CPUFREQ_RELATION_H)
> 

Most of the demand based stuff I see seems to need more "I need to 
go up/down one step."  I am not sure that it is a bad design.
Or else, you loose probably the speedstep stuff for example (something
like go up 10%, not enough, go up 10%, etc.).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
