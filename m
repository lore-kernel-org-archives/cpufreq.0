From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: hardware limits
Date: Mon, 29 May 2006 16:47:27 +0200
Message-ID: <20060529144727.GA10393@dominikbrodowski.de>
References: <44795327.5000809@laposte.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44795327.5000809@laposte.net>
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
To: Niels Borne <niels.borne@laposte.net>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sun, May 28, 2006 at 09:37:11AM +0200, Niels Borne wrote:
> I am working on a vaio laptop pcg-fr415b, using fc5 (see result of cat 
> /proc/cpuinfo above).
> Since it is quite noisy I allowed cpuspeed at startup and this improved 
> the situation a little bit.
> Still cpufreq-info (see details above -in french, but you can guess) gives
> hardware limits : 2.10 GHz - 2.80 GHz
> Is there any hope to go below 2.10 GHz and if yes, how ?

Unfortunately no -- there's a bug in the hardware which causes problems if
the frequency is lower than 2 GHz. Also, p4-clockmod doesn't save you all
that much (if at all) as it doesn't do CPU frequency and voltage scaling, so
you shouldn't worry too much about this...

	Dominik
