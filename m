From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: [2.6 patch] #if 0 cpufreq.c:cpufreq_get()
Date: Wed, 24 Oct 2007 18:17:52 +0100
Message-ID: <20071024171751.GG32333@flint.arm.linux.org.uk>
References: <20071024162312.GH30533@stusta.de>
	<20071024093839.232e5cd5@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20071024093839.232e5cd5@laptopd505.fenrus.org>
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
To: Arjan van de Ven <arjan@infradead.org>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk, Adrian Bunk <bunk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

On Wed, Oct 24, 2007 at 09:38:39AM -0700, Arjan van de Ven wrote:
> On Wed, 24 Oct 2007 18:23:12 +0200
> Adrian Bunk <bunk@kernel.org> wrote:
> 
> > cpufreq.c:cpufreq_get() no longer has any user.
> > 
> 
> it's... also a really bad/buggy interface... frquency is a per cpu
> property for one, and constantly changing (esp in a multi-core world)
> even depending on what other parts of the system are doing.

... and such an assumption which would make it impossible to use
the LCD controller on StrongARM-11x0 processors.

This is precisely why we have CPUFREQ - so that hardware which needs
to be re-timed when the CPU frequency changes can get notified of that
event and take the appropriate action.  It exists.  It works.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
