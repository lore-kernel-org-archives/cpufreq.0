From: Alex Simonov <a_simonov@yahoo.com>
Subject: Re: powernow-k7 for XP-M 2400+ CPU
Date: Wed, 26 May 2004 02:51:44 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040526095144.7917.qmail@web20812.mail.yahoo.com>
References: <20040525225007.2DCE949C52@nathan.muc.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040525225007.2DCE949C52@nathan.muc.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi, 

I'm  not sure that you can do it in a so
straightforward way, as far as I know, mobile and
desktop Athlon CPUs use slightly different tables
for the VID codes, so setting a FID/VID
combination that is known for a Mobile CPU could
not have the same effect on a desktop CPU.

I have some experince in that because I upgraded
my 1GHz Mobile Duron to Athlon XP mobile 1900+ on
my VAIO FX-502, and I had to hack the cpufreq
code to add custom table for the CPU scaling

I used the CrystalCPUID at
http://crystalmark.info/?lang=en
to determine the FID/VID pairs that worked for
me.

You may also want to see this article about
mobile<->desktop Athlons CPUs:

http://www.cpuheat.wz.cz/html/AXP_multiplier/AXP_Multiplier.htm

A table with the differences in setting VID is
given there, may be you will have to modify also
the VID states table that is defined in the
cpufreq driver.

There is even a better page at
http://people.overclockers.ru/xKVtor/records
but unfortunately it is in Russian. :( I don't
really know how good is the altavista web
translator but you could try using it if the info
on the first page is not enough.

Hope this helps a bit,

Alex

--- Harald Milz <milz@seneca.muc.de> wrote:
> Hi,
> 
> could any kind soul please send me the
> powernow-k7 output for his Athlon
> XP-M 2400+ CPU (cpuid 0x7A0)?
> 
> Background: my Asus A7V8X BIOS does not support
> Athlon mobile CPUs (and
> probably never will). But it is fairly easy to
> modify powernow-k7 in a
> way to set the PST data on the module command
> line, fill a fake struct
> pst accordingly and get a working setup. This
> could be a workaround for
> all the people who run mobile CPUs on desktop
> boards or broken notebook
> BIOSes and would like to save some power. OK we
> will not be able to set
> the voltage but setting the clock rate would
> help anyway. Collecting PST
> data for various cpuids would help here BTW. 
> 
> Remark: my Asus board w/ BIOS 1014 (latest)
> recognizes the CPU as an Athlon
> MP 1800. Duh. So the powernow and acpi modules
> do not get any chance to do
> anything because they don't get advertised a
> mobile CPU.
> 
> Yes, I am doing this on my own risk, but as
> long as you don't overclock
> there should be no problem at all. Be sure the
> patch will contain a
> warning in capital letters not to use this
> feature for overclocking...
> 
> Ciao,
> hm
> 
> -- 
> F u cn rd ths u cnt spl wrth a dm!
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
>
http://www.linux.org.uk/mailman/listinfo/cpufreq



	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 
