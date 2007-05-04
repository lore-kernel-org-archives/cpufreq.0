From: David Johnson <dj@david-web.co.uk>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 4 May 2007 23:20:40 +0100
Message-ID: <200705042320.41278.dj@david-web.co.uk>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Friday 04 May 2007 11:16, you wrote:
>
> I found that setting the cpufreq governor to ondemand making the box
> lock up solid in 2.6.20.2 and 2.6.21 after a few seconds. Sysrq
> does not work anymore, and the last messages are:
>

I've been seeing a similar issue, but with a few differences.
I'm running 2.6.21.1 on the same CPU as yourself:

longhaul: VIA C3 'Nehemiah C' [C5P] CPU detected.  Powersaver supported.
longhaul: Using ACPI support.

It seems that longhaul on my system is 'using ACPI support' whereas on yours 
it is 'using northbridge support'. I'm getting lockups after approx. 2-3 
hours using the ondemand governor. It has no problem changing the clock 
speed, and runs at the minimum speed most of the time.

I seem to recall that I get an oops when my system locks-up (the system runs 
headless normally, so it isn't easy to check). I'll investigate.

Regards,
David.

-- 
David Johnson
www.david-web.co.uk
