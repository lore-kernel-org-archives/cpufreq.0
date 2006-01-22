From: Andy Burns <fedora@adslpipe.co.uk>
Subject: Re: Speedstep on a Pentium4 630 (2.6.13)
Date: Sun, 22 Jan 2006 15:53:00 +0000
Message-ID: <43D3AA5C.6060600@adslpipe.co.uk>
References: <43CE0D1D.1070808@gmx.at> <43CE3ED9.9070303@adslpipe.co.uk>
	<43CE5994.9070300@gmx.at> <43D23CCD.4060808@adslpipe.co.uk>
	<43D2C0C2.7040900@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <43D2C0C2.7040900@gmx.at>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

cel wrote:

> I dont know ,I used on the 630 the module for the Pentium4 (dont know 
> the exact name now p4clockmod maybe) and ondemand  and at idle i had 375MHz 

Hmm, been trying to read up on EIST, seems that 14x (i.e. 2.8GHz) *is* 
the slowest clock speed P4 630 will throttle to, which kind of makes it 
a non-feature on a 3.0GHz CPU. What CPU feature does p4clockmod use to 
go lower than EIST apparently allows?

I'm running rawhide and don't see *p4*.ko did you have to build a custom 
kernel? I'd like to get idle consumption down on my box to quiet the 
fans even further ...

> and the vcore at about 1,6v (but thats not speedstep!)

lm_sensors reckons my Vcore is 1.35v to start with (perhaps I've got my 
VRM settings wrong in /etc/sensors.conf)
