From: Con Kolivas <kernel@kolivas.org>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Mon, 18 Oct 2004 08:35:49 +1000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4172F3C5.8090604@kolivas.org>
References: <20041017222916.GA30841@inskipp.digriz.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041017222916.GA30841@inskipp.digriz.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexander Clouter <alex-kernel@digriz.org.uk>
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

Alexander Clouter wrote:
>> 3. (major) the scaling up and down of the cpufreq is now smoother.  I found 
> 	it really nasty that if it tripped < 20% idle time that the freq was 
> 	set to 100%.  This code smoothly increases the cpufreq as well as 
> 	doing a better job of decreasing it too

I'd much prefer it shot up to 100% or else every time the cpu usage went 
up there'd be an obvious lag till the machine ran at it's capable speed. 
  I very much doubt the small amount of time it spent at 100% speed with 
the default design would decrease the battery life significantly as well.

Cheers,
Con
