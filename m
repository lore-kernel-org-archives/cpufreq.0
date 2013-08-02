From: Martin von Gagern <Martin.vGagern@gmx.net>
Subject: ignore_nice vs. ignore_nice_load
Date: Fri, 02 Aug 2013 22:40:21 +0200
Message-ID: <51FC1935.5030702@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi!

I just noticed that recently (apparently since 4d5dcc4211f9def4) the
sysfs file that used to be called ignore_nice_load is now called
ignore_nice. I don't know why this was renamed, but what has me
worried even more is the fact that the documentation in
Documentation/cpu-freq/governors.txt wasn't updated accordingly: it
still talks about ignore_nice_load. It would be beter to synchronize
these two again.

Investigating this issue, I also found that the file used to be called
ignore_nice in the past, but at that point apparently had an inverted
meaning. The node was renamed deliberately in 001893cda2f280ab when
the semantics changed. I can't help but wonder whether anyone might
now get confused with this old name popping up again, after all this
time. Either name is fine by me, but I am surprised nevertheless.

I hope I can get this message through without being subscribed to the
list. I would be happy if you could cc me on any replies, but as long
as someone will eventually take care of things, you may also choose to
discuss this on the list without me. I doubt I can contribute any more.

Greetings,
 Martin von Gagern
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlH8GTUACgkQRhp6o4m9dFtKXgCcD7Kr20vJACKsPnTM7dv1Rn0s
/I4An2uqLZaF08+RpTwxZ4hg26/WBVbX
=mBWO
-----END PGP SIGNATURE-----
