From: Nirmal Govind <nirmalg@psu.edu>
Subject: Re: sysfs cpufreq missing in 2.6.0
Date: Tue, 23 Dec 2003 12:01:09 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FE874D5.4020107@psu.edu>
References: <3FE86F70.8060908@psu.edu> <20031223164953.GN951@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031223164953.GN951@inferi.kami.home>
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
To: dongili@supereva.it
Cc: cpufreq@www.linux.org.uk

> sysfs is not procfs :)
> take look at Documentation/filesystems/sysfs.txt in your kernel tree
> 
> bye

Aah.. thank you! Read it and also found the cpufreq after I mounted 
sysfs. I changed the frequency too - one question: how does one know 
if it's actually working? I see the new frequency in the 
scaling_setspeed file but are there any user tools that show the 
real-time frequency of the processor?

Thanks,
nirmal
