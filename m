From: aeriksson2@fastmail.fm
Subject: Re: regression on Dell C640
Date: Mon, 22 Nov 2004 12:41:49 +0100
Message-ID: <20041122114149.53BCE3F03@latitude.mynet.no-ip.org>
References: <20041122075807.E52743F03@latitude.mynet.no-ip.org>
	<20041122083532.GB13924@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-reply-to: <20041122083532.GB13924@dominikbrodowski.de> 
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.de
Cc: cpufreq@www.linux.org.uk

On Mon, 22 Nov 2004 09:35:32 +0100 Dominik Brodowski wrote:
<snip>
>Hm. Do I understand you correctly that you don't have a
>/sys/devices/system/cpu/cpu0/cpufreq/ any longer, and/or that 
>/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq doesn't change any
>more? 

All the normal stuff is there. I see the available frequencies, and 
the current one. It's just that no attempt to change it sticks. 


> If so, please test 2.6.10-rc2 and pass "cpufreq.debug=2" to the
>kernel, and send me the dmesg [no need to cc the list on that]
>

Will do (tonight, 8h from now).

>Thanks,
>	Dominik
>

Thanks,

/Anders
