From: Harald Milz <milz@seneca.muc.de>
Subject: Re: Powernow K7 question
Date: Sun, 11 Jul 2004 09:56:06 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040711075606.342CE4BAA1@nathan.muc.de>
References: <FE0E4E3EC4669A46A5D2E835957A9FFF141D96B6@uranus.wallst.com>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Davin Carter <davin.carter@wallst.com> wrote:

> I have a mobile athlon 2400+ cpu on a shuttle AK32-E motherboard running
> Suse 9.0.  

There was a lengthy discussion about Athlon XP-M on desktop boards (in
my case, Asus A7V8X) some weeks ago - check the archives. The mainboard
needs to support at least the frequency tables for the CPU. I know of no
mainboard that does. 

What does /proc/cpuinfo say in your case? 

There are several patches to powernow-k7 that enable you to supply your own
PSB on the command line for instance. Unfortunately, the powernow
maintainers want to save the world from exploding CPUs and don't add such a
patch ;-) Contact me directly if you're interested (prepend an "h" to the
e-mail address above). 

Ciao,
hm

-- 
"I like being single.  I'm always there when I need me."
		-- Art Leo
