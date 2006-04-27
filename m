From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Few questions
Date: Thu, 27 Apr 2006 11:29:35 +0200
Message-ID: <20060427092935.GA15195@isilmar.linta.de>
References: <b6cb966c0604260104o3ff71374o6e676668b9956fc8@mail.gmail.com>
	<20060426083256.GB29984@isilmar.linta.de>
	<b6cb966c0604270216v119ba7e7jce526d2aefe472a3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <b6cb966c0604270216v119ba7e7jce526d2aefe472a3@mail.gmail.com>
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
To: Miroslav Vasic <miroslav.vasic@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Thu, Apr 27, 2006 at 11:16:03AM +0200, Miroslav Vasic wrote:
> > cpufreq.c is sort of the "glue" between all these parts of the cpufreq
> > subsystem. Regarding a "governor": what do you want to do specifically?
> > Might one of the existing ones (esp. ondemand or conservative) be good
> > enough for these purposes? Also, might you want to prefer an
> > userspace-based
> > approach.
> 
> 
>  I would like to see one of those existing governors in order to use them as
> my starting point.

less /usr/src/linux/drivers/cpufreq/cpufreq_ondemand.c
:)

or, to better understand the calling conventions a simpler one:
less /usr/src/linux/drivers/cpufreq/cpufreq_powersave.c

> As I understood from
> previous mail, "ondemand" governor changes frequency depending on the
> statistics of the system load. Does it mean that it uses Performance
> Monitoring registers of XScale?

No, based on the "kstat" array which is also exported to userspace in
/proc/stat and which is also utilized by top(1), for example.

	Dominik
