From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [2.6 patch] #if 0 cpufreq.c:cpufreq_get()
Date: Wed, 24 Oct 2007 09:38:39 -0700
Message-ID: <20071024093839.232e5cd5@laptopd505.fenrus.org>
References: <20071024162312.GH30533@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20071024162312.GH30533@stusta.de>
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
To: Adrian Bunk <bunk@kernel.org>
Cc: davej@codemonkey.org.uk, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Wed, 24 Oct 2007 18:23:12 +0200
Adrian Bunk <bunk@kernel.org> wrote:

> cpufreq.c:cpufreq_get() no longer has any user.
> 

it's... also a really bad/buggy interface... frquency is a per cpu
property for one, and constantly changing (esp in a multi-core world)
even depending on what other parts of the system are doing.
