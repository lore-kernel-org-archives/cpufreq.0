From: AthlonRob <AthlonRob@axpr.net>
Subject: Re: sysfs cpufreq missing in 2.6.0
Date: Tue, 23 Dec 2003 09:54:24 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1072202064.6531.13.camel@dell.linux.box>
References: <3FE86F70.8060908@psu.edu>
	<20031223164953.GN951@inferi.kami.home>  <3FE874D5.4020107@psu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3FE874D5.4020107@psu.edu>
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
To: cpufreq@www.linux.org.uk

On Tue, 2003-12-23 at 09:01, Nirmal Govind wrote:

> Aah.. thank you! Read it and also found the cpufreq after I mounted 
> sysfs. I changed the frequency too - one question: how does one know 
> if it's actually working? I see the new frequency in the 
> scaling_setspeed file but are there any user tools that show the 
> real-time frequency of the processor?

cat /proc/cpuinfo ....
