From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: sysfs cpufreq missing in 2.6.0
Date: Sat, 10 Jan 2004 00:09:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040109230904.GW14031@poupinou.org>
References: <3FE86F70.8060908@psu.edu> <20031223164953.GN951@inferi.kami.home>
	<3FE874D5.4020107@psu.edu>
	<1072202064.6531.13.camel@dell.linux.box>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1072202064.6531.13.camel@dell.linux.box>
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
To: AthlonRob <AthlonRob@axpr.net>
Cc: cpufreq@www.linux.org.uk

On Tue, Dec 23, 2003 at 09:54:24AM -0800, AthlonRob wrote:
> On Tue, 2003-12-23 at 09:01, Nirmal Govind wrote:
> 
> > Aah.. thank you! Read it and also found the cpufreq after I mounted 
> > sysfs. I changed the frequency too - one question: how does one know 
> > if it's actually working? I see the new frequency in the 
> > scaling_setspeed file but are there any user tools that show the 
> > real-time frequency of the processor?
> 
> cat /proc/cpuinfo ....
> 

No.  /proc/cpuinfo will only show what 'think' cpufreq internals.
Use bogomips instead for example, or eventually x86info.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
