From: Dag Bakke <dag@bakke.com>
Subject: Re: cpufreq for older Toshibas with P3-M and ALi chipset?
Date: Mon, 03 Jan 2005 00:48:19 +0100
Message-ID: <41D88843.3070606@bakke.com>
References: <41D8204F.3090108@bakke.com>
	<20050102174242.GB15802@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20050102174242.GB15802@dominikbrodowski.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk
Cc: ptb@it.uc3m.es

Dominik Brodowski wrote:

>Hi,
>
>On Sun, Jan 02, 2005 at 05:24:47PM +0100, Dag Bakke wrote:
>  
>
[snip]

>Yes, it is. Mobile Pentium 3 CPU only support two frequency scaling states.
>The 8 states you're seeing using cpuswitch are throttling states -- i.e. the
>CPU is stopped for short periods of time. However, during these periods the
>voltag isn't scaled, so it only leads to a linear reduction of power
>compared to a ~ ^3 reduction if voltage is reduced as well. Furthermore, the
>state the CPU is in when stopped equals the state the CPU is put into when
>there is no work to do -- all this leads to the fact that throttling is
>useless in most cases.
>  
>
[snip]
OK... but this bit....

>>BTW:
>>I do notice that if I fiddle with the BIOS settings, I can make the 
>>laptop boot at "half speed", coming up at 500 MHz instead of 1000. (As 
>>displayed in /proc/cpuinfo.) And the P-states driver still works, so 
>>presumably it is possible to combine 'native support' and P-states to 
>>obtain 16 steps? :-)
>>    
>>
>
>No :-) Probably this "half speed" mode means the front side bus speed (which
>is multiplied inside the CPU) is put to 50%. And unless you find out how
>this is accessible during a runtime system, there's no chance to combine
>these two.
>  
>
...made me thinking...

Will x86info be fooled by throttling states? Will it report the actual 
clock, or the effective clock taking 'stops' into account?

Not to distrust you, but I am trying to figure out if the cpuswitch 
thingy is throttling or multiple FSB frequencies. Because x86info -mhz 
reports a likely clock frequency for every cpuswitch step. And if 
/proc/cpuinfo shows the system running at 500 Mhz and 'step 4' and this 
is due to a new FSB speed...
I am sure you understand my reasoning.

Not sure it will mean a lot for power consumption anyway..

Dag B.
