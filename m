From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Fri, 19 Sep 2003 10:24:21 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F6ABD35.9070104@basmevissen.nl>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <m24qz9r0ko.fsf@tnuctip.rychter.com>
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
To: Jan Rychter <jan@rychter.com>
Cc: cpufreq@www.linux.org.uk

Jan Rychter wrote:
> 
> I've tried echo "0%100%powersave" > /proc/cpufreq 
>   and 
>  echo "0%50%powersave" > /proc/cpufreq
> 
> and much to my surprise, even though /proc/cpufreq echoes my changes, I
> can see no resulting changes in power consumption as reported by ACPI
> battery proc entry.
> 

The line should read echo "0%0%100%userspace" >/proc/cpufreq to get 
manal control over the speed.
Then select the speed by doing

cat /proc/sys/cpu/0/speed-min > /proc/sys/cpu/0/speed

or

cat /proc/sys/cpu/0/speed-max > /proc/sys/cpu/0/speed

powersave will only change speed when you connect or disconnect AC power.

Bas.
