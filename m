From: Dave Jones <davej@redhat.com>
Subject: Re: Release 1.00.08 of the AMD64 Frequency Driver
Date: Sat, 27 Sep 2003 16:41:24 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030927154122.GE5507@redhat.com>
References: <99F2150714F93F448942F9A9F112634C080EF0A6@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C080EF0A6@txexmtae.amd.com>
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
To: paul.devriendt@amd.com
Cc: davej@codemonkey.org.uk, pavel@suse.cz, richard.brunner@amd.com, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk

On Fri, Sep 26, 2003 at 06:47:12AM -0500, paul.devriendt@amd.com wrote:
 > Hi Dave,
 > 
 > Attached is a bzipped tar file containing frequency support for 
 > AMD's Athlon 64 and Opteron. There are 2 .c files in the tarball 
 > - one for 2.4 and one for 2.6.
 > 
 > I believe this is it for now, but there will be more updates coming
 > soon. (Sorry, can not define soon). There are some hardware changes
 > coming that will impact this, and also adding code for battery
 > detection with ACPI.

Looks good. I'll merge this to the 2.6 cpufreq tree, and push it to
Linus over the weekend. (Should go verbatim unless there are last-minute
compile fixes needed).

Thanks for the various cleanups that were performed on this code.

I'll leave the 2.4 merge to either Bruno.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
