From: <lutris@gmail.com>
Subject: Re: Clock runs twice as fast when CPU speed is halved on AMD Turion
	64 mobile (Compaq Presario V2311US)
Date: Tue, 27 Sep 2005 18:36:05 -0400
Message-ID: <8d7939e205092715365fb8127f@mail.gmail.com>
References: <8d7939e2050924202679c61e8b@mail.gmail.com>
Reply-To: lutris@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <8d7939e2050924202679c61e8b@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

I found a solution to my clock speed problem.  Apparently Linux can
use a variety of timer sources for the clock, some of which are less
reliable than others.  Appending this kernel parameter fixed the
problem for me:

no_timer_check=3D0
