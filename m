From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Hardware P-state driver for AMD Opterons, etc.
Date: Mon, 5 Jun 2006 12:40:39 -0400
Message-ID: <20060605164039.GA15579@redhat.com>
References: <84EA05E2CA77634C82730353CBE3A84305350551@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84305350551@SAUSEXMB1.amd.com>
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
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, Jun 05, 2006 at 10:18:10AM -0500, Langsdorf, Mark wrote:

 > > Mark, your editor seems to use a mix of spaces and tabs, 
 > > which looks really strange. I've fixed up the few cases that 
 > > stood out, so you may want to base your next diff on what 
 > > turns up in -mm4 when Andrew releases that tree.
 > 
 > I'll do that.

Great, thanks.

 > Sorry for the whitespace confusion; I thought I was running 
 > pure vim and it was doing the right thing.

I have this in my .vimrc ...

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

Which is really handy when reviewing diffs.
I usually also do a search for tabs too, and due to "set hls",
any mix of spaces/tabs usually stands out, and if it's on a +/-
line of a diff, I usually just fix the diff 'in-place' rather
than fixing the file & rediffing.

		Dave

-- 
http://www.codemonkey.org.uk
