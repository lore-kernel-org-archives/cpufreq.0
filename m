From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Problem with ondemand on Athlon [and P4 too]
Date: Fri, 31 Oct 2003 13:27:59 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031031122758.GA2617@inferi.kami.home>
References: <200310310434.01311.thierry.lathuille2@libertysurf.fr>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200310310434.01311.thierry.lathuille2@libertysurf.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Fri, Oct 31, 2003 at 02:14:32PM +0100, Thierry Lathuille wrote:
> Hi,
[...]
> But echoing "ondemand" to 
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor has unexpected effects:
> - the keyboard stops working - but the mouse still works, I can use apps in 

happens the same here on a P4 1.8GHz with 2.6.0-test9

> - I can't kill any xterm anymore. But the other applications work and can be 
> killed normally.
> - trying to reboot hangs the system.

I tried from console (no X running). 
echoing ondemand > /sys/.../scaling_governor never returns, all the
consoles are freezed, keyboard too. I can ssh in and can cat
/sys/.../scaling_governor obtaining *ondemand* correctly. The *ondemand*
directory is also created. I forgot to check dmesg, I'll check it this
evening or tomorrow

I'll add more info when I'll go back home :)
-- 
mattia
:wq!
