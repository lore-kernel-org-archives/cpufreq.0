From: Nebojsa Trpkovic <trx@inbox.ru>
Subject: Re: ondemand question?
Date: Tue, 26 Oct 2004 09:34:20 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <417DFDFC.2000504@inbox.ru>
References: <88056F38E9E48644A0F562A38C64FB60032E52FD@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60032E52FD@scsmsx403.amr.corp.intel.com>
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
To: cpufreq@www.linux.org.uk

Pallipadi, Venkatesh wrote:

>The frequency is not fixed. Default freq will depend on what amount of
>time does CPU actually take to change the frequency. And user can change
>this default value within some limits.
>
>Once you start using ondemand governor you will find this (and other
>ondemand tunables here)
>/sys/devices/..../cpufreq/ondemand/sampling_rate
>/sys/devices/..../cpufreq/ondemand/sampling_rate_max
>/sys/devices/..../cpufreq/ondemand/sampling_rate_min
>(all the numbers here are in uS)
>
>Thanks,
>Venki
>  
>
Thank you. I made changes I needed. Only thing I don't understand here 
is purpose of "sampling_down_factor", but I think I have some idea what 
it can be (because of slow slowing down of the CPU)...

Thank you.
