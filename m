From: Dave Jones <davej@redhat.com>
Subject: Re: [Bug 8581] acpi-cpufreq gets very confused on suspend to ram
Date: Mon, 22 Oct 2007 16:49:24 -0400
Message-ID: <20071022204924.GB7793@redhat.com>
References: <bug-8581-3570@http.bugzilla.kernel.org/>
	<20071022002423.3FC91108014@picon.linux-foundation.org>
	<87640zr3ka.fsf@denkblock.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <87640zr3ka.fsf@denkblock.local>
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
To: Elias Oltmanns <eo@nebensachen.de>
Cc: cpufreq@lists.linux.org.uk

On Mon, Oct 22, 2007 at 09:50:13AM +0200, Elias Oltmanns wrote:

 > > there's some whitespace damage in this patch (spaces instead of tabs).
 > > Asides from that though, it looks like the right thing to do.
 > > Can you fix that up, and bounce a copy to cpufreq@www.linux.org.uk please?
 > 
 > Well, since this patch was mainly a copy-and-paste job from
 > cpufreq_userspace.c, the whitespace damages have been inherited once. In
 > fact, I have stumbled upon some more whitespace issues in in the cpufreq
 > subsystem and there are also some problems with lacking whitespace
 > causing misprinted debugging messages. If you're interested, I can come
 > up with a patch fixing all those problems I've accidentally come across.

Yeah, it does seem to be a bit of a disaster.  I've just removed some
of the more obvious whitespace damage in cpufreq.git.  If you spot
any others after that, patches gratefully accepted.

 > Here is the patch fixing cpufreq_conservative.c anyway. It applies to
 > 2.6.23.

Applied, thanks Elias.

	Dave

-- 
http://www.codemonkey.org.uk
