From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: ARM926TEJ V5
Date: Fri, 6 Apr 2007 07:47:15 +0100
Message-ID: <20070406064715.GA6730@flint.arm.linux.org.uk>
References: <bb5d68b20704052040w135a647flb175ce530f39bde7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <bb5d68b20704052040w135a647flb175ce530f39bde7@mail.gmail.com>
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
To: claudio <claudioeddy@gmail.com>
Cc: Cpufreq@lists.linux.org.uk

On Thu, Apr 05, 2007 at 11:40:57PM -0400, claudio wrote:
> Hi...b4 anything HAPPY EASTER to whom celebrate it!!!
> So, I'd like to know whether cpufreq can be used on ARM926TEJ V5 or not. Can
> someone please tell me that. If not what could I do to use cpufreq on it?
> which libraries will I need to use to do so?

ARM CPU cores themselves have no support for CPU frequency scaling.
However, the SoC that they're embedded in may allow for the CPU
frequency to be altered at runtime.

So given the information in your message, your question is unanswerable.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
