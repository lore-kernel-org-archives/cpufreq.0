From: =?UTF-8?B?RmVyZGluYW5kIEjDvGJuZXI=?= <fh@cvmx.org>
Subject: Re: CPU-Frequency limited to lowest available frequency	while	under
	load
Date: Tue, 06 Nov 2007 17:01:25 +0100
Message-ID: <47308FD5.4060707@cvmx.org>
References: <4727062E.9090806@cvmx.org>	<1193837319.4590.466.camel@queen.suse.de>
	<472A15FF.5040504@cvmx.org> <1193941879.4202.17.camel@noname>
	<472A1CC0.5080409@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <472A1CC0.5080409@redhat.com>
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
To: cpufreq@lists.linux.org.uk

Jarod Wilson wrote:
> I didn't pay much attention to earlier posts in this thread, so pardon
> if this has already been covered, but...
> 
> I had a similar sounding case reported in the Red Hat bugzilla, where a
> Dell laptop wouldn't scale above its minimum frequency if the system was
> running on a travel charger. This turned out to be a limitation imposed
> intentionally by the system BIOS (and documented somewhere on Dell's web
> site). On battery and on the normal charger, the same system had no
> problems whatsoever.
> 
> Just throwing it out there, ignore me if its irrelevant. :)
> 

I gave it a shot and did a BIOS update and played around with the
options in the BIOS.
Now it does scale correctly... I should have tried that earlier, I did
not expect that, because I "only" did a kernel upgrade and did not touch
the BIOS in any way...

Thanks!

Ferdinand
