From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] fix up CPU detection in p4-clockmod
Date: Sat, 10 Jan 2004 14:19:46 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040110141946.6b0ed7ff.akpm@osdl.org>
References: <20040110151248.GA7989@dominikbrodowski.de>
	<20040110155048.GA17500@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040110155048.GA17500@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

Dave Jones <davej@redhat.com> wrote:
>
> On Sat, Jan 10, 2004 at 04:12:48PM +0100, Dominik Brodowski wrote:
>  > Too many users use the p4-clockmod cpufreq driver instead of the more
>  > advanced speedstep-centrino, speedstep-ich or even acpi drivers. All of the
>  > latter (usually) provide voltage scaling, while the p4-clockmod driver only
>  > offers a variant of frequency scaling. So, warn users if they try out this
>  > driver instead.
>  > 
>  > Also, instead of using a local copy, use the speedstep_lib infrastructure
>  > for detecting the processor speed. Adding the Pentium-M get_frequency
>  > function to that module only costs about 200 bytes in object size.
> 
> another idea might be putting the cpu identify code into a speedstep.ko
> and have that request_module the right module
> 

That seems like a more user-friendly approach to me.

I'll merge Dominik's patch while we think about it.
