From: Dmitry Torokhov <dtor_core@ameritech.net>
Subject: Re: [PATCH] fix cpufreq_update_policy
Date: Wed, 28 Jan 2004 19:24:27 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <200401281924.27484.dtor_core@ameritech.net>
References: <20040128215249.GA4727@dominikbrodowski.de>
	<200401281712.30477.dtor_core@ameritech.net>
	<20040128221636.GA5390@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040128221636.GA5390@dominikbrodowski.de>
Content-Disposition: inline
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Wednesday 28 January 2004 05:16 pm, Dominik Brodowski wrote:
> On Wed, Jan 28, 2004 at 05:12:30PM -0500, Dmitry Torokhov wrote:
> > Why not change it to:
> >
> > 	policy = *data;
> >
> > ?
>
> Because I doubt this works for whole structs. Or am I totally wrong
> (again)?
>
> 	Dominik

The assignment does not work only for arrays because really arrays are
constant pointers:
	char a[] == char * const a 

With structures everything is clear, size, etc. I think that K&R did not
support structure assignment but I believe that it appeared at least in
C89.

-- 
Dmitry
