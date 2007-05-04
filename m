From: =?UTF-8?B?UmFmYcWCIEJpbHNraQ==?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 04 May 2007 21:00:23 +0200
Message-ID: <463B82C7.7020107@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>	
	<463B687D.1020600@interia.pl>
	<5699f8f00705041108t67425997w42e6268f9076abc9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <5699f8f00705041108t67425997w42e6268f9076abc9@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="utf-8"
To: Wander Winkelhorst <w.winkelhorst@gmail.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org

> Hi Rafał,
Hi 
>> >
>> > I found that setting the cpufreq governor to ondemand making the box
>> > lock up solid in 2.6.20.2 and 2.6.21 after a few seconds.
>> > [...]
>>
>> I can't explain this. Some motherboards are running fine, some don't.
>> I'm running longhaul too. It is working fine. No lockups at all.
>> So far I heard only about one Epia which had problems with longhaul.
>> It was almost like my Epia but older.
>> What is possible:
>> - some chipsets revisions are broken and aren't blocking DMA,
>> - special setup is required, some versions of BIOS are doing
>> necessary things, some don't,
> 
> Which BIOS are you using?
Latest beta BIOS which was supposed to fix Linux "DMA timeout" bug. 
I don't remember exact version, It wasn't fixing this bug.
> [...]
>> Btw. I've been writting many times: if You want to use ondemand with
>> Longhaul You don't need cpufreq at all. It is just one another cool
>> gadget for You. Longhaul wasn't designed to change frequency often.
>> It has big latency and requires so much preparation that it isn't worth
>> if You don't need to save power or cool down CPU.
> 
> What should I use instead of ondemand? I do want to save power and
> have my machine run cooler (I have a htpc that is on 24/7, it's
> running kind of hot and allready has blown a PSU)
I'm using conservative. It is allowing me to turn off fan with 
bigger cooler borowed from AMD CPU.
> Does the userspace governor have the same problems? (I'd guess so)
For testing I was using userspace governor. 1s interval, Min to max. 
1s interval. Max to min.
I don't like userspace programs. Most of them is doing exactly the 
same thing which ondemand does.
> I'd like to take this opportunity to thank you for the work you have
> already done on cpufreq!
> So: thanks Rafał! I appreciate it!
Thanks, but it isn't working. It isn't good job. It isn't nothing more 
then luck.
> [...] 
> I am using the onboard mpeg2 hardware decoder with the Openchrome drivers
Me too. Works great. As usual not thanks to VIA, but good developers 
diging in binary drivers.
> I hope this helps someone
> Wander.
Regards
Rafał


----------------------------------------------------------------------- Linda jako gospodyni domowa - zobacz!!!
>>> http://link.interia.pl/f1a79
