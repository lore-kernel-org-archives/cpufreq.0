From: Mattia Dongili <dongili@supereva.it>
Subject: Re: [RFC] cpufreqtools
Date: Mon, 25 Oct 2004 14:17:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041025121743.GH2998@inferi.kami.home>
References: <20041021172227.GA24663@dominikbrodowski.de>
	<20041025090139.GC2998@inferi.kami.home>
	<20041025111150.GA7655@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041025111150.GA7655@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Mon, Oct 25, 2004 at 01:11:50PM +0200, Dominik Brodowski wrote:
> On Mon, Oct 25, 2004 at 11:01:39AM +0200, Mattia Dongili wrote:
[...]
> Maybe I didn't express my intention too clearly: the code doesn't do "aut"
> (as in Latin) or either/or (as in English). It preferres sysfs, but doesn't
> find sysfs to be doable, it falls back to proc if possible.

Uh! sorry, it's me who didn't look at the code deeply enough, now I see
that every function actually has a fallback to the proc interface (well,
I noticed it but didn't inspect interfaces.h deeply enough).

[...]
> You can define one of them or both; only both not defined will not work, of
> course...

Ok, I'll try consider this limitation in the configure script (see
below)

> As 2.6. kernels are preferred to use for cpufreq, but it depends on libsyfs
> -- and will only link correctly if libsyfs is present -- I'd like to make
> #define INTERFACE_SYSFS dependant on libsysfs; and #define INTERFACE_PROC on
> some "--enable-proc-interface" passed to ./configure...

so:
  if libsysfs present and not --disable-sysfs-interface
    #define INTERFACE_SYSFS
  if --enable-proc-interface
    #define INTERFACE_PROC

  if neither INTERFACE_SYSFS nor INTERFACE_PROC are defined
    fail

does it sound good?

Also, do you agree in splitting your package in libcpufreq-VERSION and
cpufreqtools (that depends on the former)?

-- 
mattia
:wq!
