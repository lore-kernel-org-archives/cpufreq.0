From: Carl Thompson <cet@carlthompson.net>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Sun,  6 Jul 2003 10:11:00 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1057511460.d2cf9bc12efe7@carlthompson.net>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr>
	<20030706012114.GW7796@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030706012114.GW7796@poupinou.org>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Quoting Ducrot Bruno <ducrot@poupinou.org>:

> ...

> There is a little bug in powernow-k7.c

> ...

> -		change_VID(fid);
> -		change_FID(vid);
> +		change_VID(vid);
> +		change_FID(fid);

> ...

> It is not in mainline AFAIK.

This "little bug" caused my computer to repeatedly crash with 2.4.21-ac4 and
2.5.72!  Not sure if it's in more recent kernels, but it was definitely in
the mainline at that point.

Carl
