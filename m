From: "David Flogeras" <dflogera@iotek.ns.ca>
Subject: RE: TM5800 and longrun
Date: Wed, 21 Apr 2004 10:27:45 -0300
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <PLEKLEBDHEEMEIKIDEGNOEEICAAA.dflogera@halifax.mda.ca>
References: <20040420203953.GA9411@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040420203953.GA9411@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

OK that works!

Why can I not set the minimum any lower than 73% ?  Is this a hardware
limit, or is something not working right.

Dave

-----Original Message-----
From: cpufreq-bounces@www.linux.org.uk
[mailto:cpufreq-bounces@www.linux.org.uk]On Behalf Of Dominik Brodowski
Sent: Tuesday, April 20, 2004 5:40 PM
To: David Flogeras
Cc: cpufreq@www.linux.org.uk
Subject: Re: TM5800 and longrun


On Tue, Apr 20, 2004 at 05:34:16PM -0300, David Flogeras wrote:
> cat /proc/cpufreq
>
>          minimum CPU frequency - maximum CPU frequency - policy
> CPU 0		367000 kHz ( 73 %) -     367000 kHz ( 73%) - performance

Good. You can set the "policy" with the following command:

echo -n "0%AAA%BBB%CCC" > /proc/cpufreq

where
AAA needs to be replaced with the minimum CPU frequency percentage (0-100)
BBB needs to be replaced with the maximum CPU frequency percentage (0-100)
CCC needs to be replaced with the CPU mode: that's either performance or
    powersave for TMTA CPUs.

e.g.  #echo -n "0%80%90%powersave" > /proc/cpufreq
to set the CPU to the frequency range of 80 to 90 percent, and to use the
"powersave" mode of the CPU.

	Dominik


_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq
