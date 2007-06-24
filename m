From: "Phil Endecott" <phil_fvnqz_endecott@chezphil.org>
Subject: Re: Power measurements
Date: Sun, 24 Jun 2007 23:14:18 +0100
Message-ID: <1182723258692@dmwebmail.belize.chezphil.org>
References: <467DB356.7050309@interia.pl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <467DB356.7050309@interia.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Rafal Bilski wrote:
>> Len Brown wrote:
>>> On Saturday 23 June 2007 08:54, Phil Endecott wrote:
>>>> Dear All,
>>>>
>>>> I would like to share some power consumption numbers that I have just
>>>> measured on my VIA C7-M system.  It uses the e_powersaver module and
>>>> can run at 400MHz or 1.2GHz.  I have measured the power consumption
>>>> when idle and when running a "while(1){}" program at each speed:
>>>>
>>>>          400    1200
>>>> Idle    16W    16W
>>>> Busy    17W    20W

Here are some more accurate numbers:

         400      1200
Idle    10.55    10.91
Busy    11.47    13.48

[The first numbers were made with a mains power meter.  The second ones 
were made between the power supply and the motherboard; I used a power 
supply extension cable, cut in half, with some 0.01 and 0.1 ohm series resistors.]

>>>> What I find interesting is that the idle power at 1.2GHz is identical
>>>> to that at 400 MHz.
> It isn't.
>>>> This makes me wonder if the on-demand governor would actually save
>>>> any power at all.
> There is a difference of 0,5W~1,0W max.

Agreed!


>>> The exception is if the processor doesn't automatically
>>> adjust it voltage when entering idle.  In this case,
>>> idle power would depend on the frequency of the processor
>>> when idle was entered -- not because of the frequency --
>>> but because of the associated voltage.
>> 
>> Ah, I had wondered about this.  According to sensors, Vcore is always
>> 1.09 V.  (Hmm, I can't be sure that I'm looking at the right line in the
>> output of the sensors program, or that it is configured correctly.  But
>> none of the voltages change.)  Are there any VIA experts reading this
>> who know what's supposed to happen?
> % dmesg | grep eps 

Thanks, yes, I found this after I posted my last message.  Apparently 
it should use 860 mV at 1.2 GHz and 844 mV at 400 MHz.  So I was 
looking at the wrong line when I reported 1.09 V;  0.86 V is reported 
in another line.

> But most C7-Eden doesn't scale voltage.

That is consistent with what I'm seeing, and it's unfortunate.  (You 
say 'most'; do you know of *any* C7 boards that DO change the voltage?  
And how much difference would it make?  (0.844/0.860)^2 = 0.96, i.e. a 
4% saving if power is proportional to V^2, which is what how CMOS 
worked back in the days when I understood it.)

(And just to be certain: in e_powersaver you write to one register 
which both changes the frequency and asks for a different voltage at 
the same time; so there's no chance of a software change to correct 
this - right?)

>>> back to you question -- 20 - 16W = 4W is on the table;
>>> and the performance difference between 400 and 1200 is on the table.
>> 
>> Well, in idle, the power difference is zero and the performance
>> difference is zero.
>> When active, on-demand would use the higher frequency anyway.
>> So it looks to me as if 'on-demand' and 'performance' will behave
>> identically in terms of both power and performance.
> If CPU is sleeping a lot even 0,5W can make a difference. But there is 
> time needed to enter 400MHz and time needed to leave 400MHz.

My understanding of the C7 clock switching (which only comes from a VIA 
powerpoint presentation) is that because it has 2 PLLs it can change 
from one clock to the other much more quickly than other processors 
which have to wait thousands of cycles for the PLL to stabilise after changing.

> In real life "performance" governor will use less power.

Well, if that's true then I think we ought to discourage people from 
using 'ondemand' with the C7.


Many thanks for your feedback.  My aim is to make this machine as 
power-efficient as possible, which I've achieved mainly by working on 
the PSU (the first one I had was < 40% efficient, now I'm up to about 
70%), and by using a solid-state disk.  It's getting increasingly 
difficult to find things to improve!


Regards,

Phil.
