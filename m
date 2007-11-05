From: "William Dieter" <william.dieter@gmail.com>
Subject: Re: how do I measure the time it takes to switch between frequencies?
Date: Sun, 4 Nov 2007 22:24:54 -0500
Message-ID: <fb93f99d0711041924o4f269dcdkd7a173a5864a5cfc@mail.gmail.com>
References: <b9bbbad00711010502x171c19b7y6f6d6d5ff0a182f1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <b9bbbad00711010502x171c19b7y6f6d6d5ff0a182f1@mail.gmail.com>
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
To: Ankur Shah <shahankur11@gmail.com>
Cc: cpufreq@lists.linux.org.uk

If your PC has a parallel port, you can use the outb instruction to write
arbitrary bytes to the parallel port.  One of the system headers has a
wrapper for outb, so it is easy to call from C code.  Set one bit on the
parallel port high before the frequency transition and set it low after the
frequency transition.  You can use an oscilloscope to measure the transition
time.

There are several caveats.  First, changing the state of the parallel port
takes about 1 microsecond.  If 1 microsecond is a significant part of the
transition time, then you will have to find a different technique.  Second,
the outb instruction only works if you are root, or if root uses ioperm or
iopl to pass the right to use the port to a child process.

Bill Dieter.

On 11/1/07, Ankur Shah <shahankur11@gmail.com> wrote:
>
> Hello folks,
>
> I am trying to evaluate the performance of parallel benchmarks at various
> frequencies and was wondering how would I actually go about measuring the
> time it takes to switch between 2 frequencies.
> (I am guessing since rdtsc is measured based on cycles, it is kindof
> useless
> when the frequency itself it changing)
> Any ideas on how would I go about doing this?
>
> -Ankur
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
